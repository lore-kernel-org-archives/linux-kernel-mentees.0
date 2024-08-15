Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EB41BF326
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713634; cv=none; b=bdsSoY7S61+fdPmxs2DTAZuFm6DwOX+AtP9EOrxUlM2utF4ULhLKL5f7ueVuGEdYimvqtCBOaPsOYZt9IxGoJKg9sHjB1BxHZbFp3skJ5nzC0+MetRekkCs7Gjrb3R6TwBwajg+5pzRFFUjw6rhHQySf5dQueCaNFGihB+MX9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713634; c=relaxed/simple;
	bh=fCPEKdvZte72nEo47KA/kZnx4XIPsFUVSnD634fu6gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKQs0urndTdSLsLEnw5ZjJIfLOIukt4XO7urnSHiA0hGToQ3sunHWUYPil0aHmOUUyrVAaLdBuFdpSoxVUc9qqSjSKSySqHWn87KmWZszs+QKkWW4rmPgNZRnjuVxeqMOg4bR9dsfnUnbfSRwDRWnlPNPkpFuqh6bZ7AtWT1dEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zcq6hIT0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zcq6hIT0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6182460A52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksb1vb3EPhGB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 09:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC48360A3D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC48360A3D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zcq6hIT0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC48360A3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:20:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78F0C61A22;
	Thu, 15 Aug 2024 09:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE69C32786;
	Thu, 15 Aug 2024 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723713629;
	bh=fCPEKdvZte72nEo47KA/kZnx4XIPsFUVSnD634fu6gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zcq6hIT0G/Kulf+4TPYAmpBxlcytmgbiXR5YQ0pz6wQoLX1H/jq70wYR0M2o3vNGO
	 X1Jm6qIATKY+ivVIO1qwYCb15KpnjvLh58WdHSXVnIJsgfRvrJE8mWMPAHbLP41gog
	 e6QX2U6qCxQBaDsacN/3vYeRpJg6p/YFZdb28bPM=
Date: Thu, 15 Aug 2024 11:20:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <2024081501-pried-rewire-e229@gregkh>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
 <2024081518-fracture-thousand-c20e@gregkh>
 <Zr3B9Sccu+1FHW2z@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr3B9Sccu+1FHW2z@embed-PC.myguest.virtualbox.org>

On Thu, Aug 15, 2024 at 02:23:09PM +0530, Abhishek Tamboli wrote:
> On Thu, Aug 15, 2024 at 09:59:35AM +0200, Greg KH wrote:
> > On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> > > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > > and uvc_v4l2_enum_format().
> > > 
> > > Fix the following smatch errors:
> > > 
> > > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > > 
> > > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > > 
> > > Also, fix similar issue in uvc_v4l2_try_format() for potential
> > > dereferencing of ERR_PTR().
> > > 
> > > Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> > > Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> > > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()
> > 
> > You sent 2 copies of this, which is the correct one?
> Sorry about that. Actually, I forgot to add the maintainer: Laurent Pinchart 
> in my first Patch v2 mail.

Ok, then that would be a v3, right?  Please remember we get hundreds of
patches a day and keeping them all straight is important :)

thanks,

greg k-h
