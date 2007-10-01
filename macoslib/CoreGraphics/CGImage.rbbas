#tag ClassClass CGImageInherits CFType	#tag Method, Flags = &h0		 Shared Function NewCGImage(p as Picture) As CGImage		  if p is nil then		    return nil		  end if		  dim g as Graphics = p.Graphics		  		  if g is nil then //copy into new picture		    dim pCopy as new Picture(p.Width, p.Height, 32)		    dim gCopy as Graphics = pCopy.Graphics		    if gCopy is nil then		      return nil		    end if		    gCopy.DrawPicture p, 0, 0		    p = pCopy		    g = gCopy		  end if		  if g is nil then //I give up		    return nil		  end if		  		  dim gworldData as Ptr = Ptr(g.Handle(Graphics.HandleTypeCGrafPtr))		  if gworldData = nil then		    return nil		  end if		  		  soft declare function QDBeginCGContext lib CarbonFramework (port as Ptr, ByRef contextPtr as Ptr) as Integer		  		  dim c as Ptr		  dim OSError as Integer = QDBeginCGContext(gworldData, c)		  if OSError <> 0 or c = nil then		    return nil		  end if		  		  soft declare function CGBitmapContextCreateImage lib CarbonFramework (c as Ptr) as Ptr		  		  dim image as CGImage = CGBitmapContextCreateImage(c)		  		  soft declare function QDEndCGContext lib CarbonFramework (port as Ptr, ByRef context as Ptr) as Integer		  		  OSError = QDEndCGContext(gworldData, c)		  		  return image		End Function	#tag EndMethod	#tag Method, Flags = &h0		 Shared Function ClassID() As UInt32		  soft declare function CGImageGetTypeID lib CarbonFramework () as UInt32		  		  return CGImageGetTypeID		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function ColorSpace() As CGColorSpace		  if me = nil then		    return nil		  end if		  		  soft declare function CGImageGetColorSpace lib CarbonFramework (image as Ptr) as Ptr		  		  dim theSpace as CGColorSpace = CGImageGetColorSpace(me)		  theSpace.Retain		  return theSpace		End Function	#tag EndMethod	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			if me = nil then			return 0			end if						soft declare function CGImageGetWidth lib CarbonFramework (image as Ptr) as Integer			return CGImageGetWidth(me)			End Get		#tag EndGetter		Width As Integer	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			if me = nil then			return false			end if						#if targetMacOS			soft declare function CGimageIsMask lib CarbonFramework (image as Ptr) as Boolean						return CGImageIsMask(me)			#endif			End Get		#tag EndGetter		IsMask As Boolean	#tag EndComputedProperty	#tag ComputedProperty, Flags = &h0		#tag Getter			Get			if me = nil then			return 0			end if						#if targetMacOS			soft declare function CGImageGetHeight lib CarbonFramework (image as Ptr) as Integer						return CGImageGetHeight(me)			#endif			End Get		#tag EndGetter		Height As Integer	#tag EndComputedProperty	#tag ViewBehavior		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass