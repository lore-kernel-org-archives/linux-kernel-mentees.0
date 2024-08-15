Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7531EB31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708786; cv=none; b=KBsgTc03cAxvW/LeVSTcL7yD8yl75WyAg8VZPDw5Ad3Cy5qd0a/lXUjQ4Gfd4VGtKRLbycnMvY726pijcy9yCd4Wwxy7/nZNZ+b1CDZ1CJYPVEN2BFQMfvryj5S+oBexa+iow2THsiVoqtPoN4VDwvnMd7AyKmSt8eQ8fIJojcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708786; c=relaxed/simple;
	bh=7132GJBXAtafD28xtFBjPMMrHtCJ5+HNa0V0cVDn5MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo/6L/DOfJvBQr4ZpQH49nB6qQBEVlC1s3mNiiZh/C2hNryTsrFWho3s7KoFiO0Y0Ayrg6L68IuiRVX4nRtGu7rXxj0ew38KK6tEWtO1htMlPKs3iBU7xRmUM2EccjXkUVz9ddBuus9/rQIf6G2ltT8iT0DfEM8xXhAPpYxCg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RR7/nufK; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RR7/nufK"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B39640746
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyE2RI1L0_py for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 07:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86D2840743
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86D2840743
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=RR7/nufK
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 86D2840743
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 07:59:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BD89CE1ACB;
	Thu, 15 Aug 2024 07:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA36EC32786;
	Thu, 15 Aug 2024 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723708778;
	bh=7132GJBXAtafD28xtFBjPMMrHtCJ5+HNa0V0cVDn5MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RR7/nufKlWtJIpqkB0QzCei0gE5u7ma/crBywtrvNMWIKyLe+2pQYHT5ay9hMxND7
	 hEkkdNAPWScSgQUAWkZGMoLuPEYP4ic660wHSUqemG5UulNfAeZ1/I5V2kqlqC+7xE
	 kSEwhDKlmlgUZnVohwh3rwKpPDIXVDeVZiF+/O7I=
Date: Thu, 15 Aug 2024 09:59:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <2024081518-fracture-thousand-c20e@gregkh>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815071416.585559-1-abhishektamboli9@gmail.com>

On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> and uvc_v4l2_enum_format().
> 
> Fix the following smatch errors:
> 
> drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> Also, fix similar issue in uvc_v4l2_try_format() for potential
> dereferencing of ERR_PTR().
> 
> Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()

You sent 2 copies of this, which is the correct one?

thanks,

greg k-h
