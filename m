Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AD2190070
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130493; cv=none; b=ieFEjxR1eAdnTWYNDOtpIq1vAIPLiDG03NR4bec0E1h0/p87cyi8APHIrKg/r7VcbRqDfkt2Coi19/K6EPCZF+VmJ85wgMsFVVvfDpEWFVa7G6/dUpz4cIzYqcWB4Gf2XwjG8aMICM8zOilaKACMjgpBtpDj6qOuEPDVX2qce6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130493; c=relaxed/simple;
	bh=LLGMog3ghLftfvDRa/wahzoGWmeO97Nond6HOcgHgRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMrpYERUML9H4oib/NWIztjQaq+7fwzdl/lBe7V8xtCKVl9hkI0cDernzbbxW+FrjnNJIwoXrwxLWj7z2vviux39FGbsPKbdyc6KJhvJxJFi3HKVQb4GYMMQiT0TSlq/AzQDqwKxxspgcRCCuaWt5h8EjltbYdkz5Ir8uxl1tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxuelg3I; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxuelg3I"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458F18142F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qkz708t660m for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 15:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65EA480ED0
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65EA480ED0
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jxuelg3I
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 65EA480ED0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:21:29 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-81fd9251d99so40891039f.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723130488; x=1723735288; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qrVoz2J1yx28Dbm2oNk/ENgURyNTgPZNBRNbJticAY=;
        b=jxuelg3I0Q1VUrHTOK+rfFlkoo7hh+8klyPYmwLIxOPZjoRSGcA0HwHf3CJ+RRw6Mo
         vr92iB1QuUDtq04ao+Dwk4B0H3d51ZavWW0IomlyfBVo1W/M7WDx6UwdIInvEa90ygD2
         v4MT9/CH+JTMY7wDH5wNylt2f/n+g4i7IxiT0HOyKobOVYNvxgWzShapp4k8dsc39EnS
         4KzIof3uhB0fwTzI5abJ4XZoaDdGJ0GlvI1E4gB3liHECe8x1pxqDgBiQMyvJFZ2FPf5
         XTq5lAZAxgKU1OS5RfJq/J+S3zmz9ZnM8wVpbukxbmh7jQFtgDe/jEcGGrdA+j9t3u4r
         4raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130488; x=1723735288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qrVoz2J1yx28Dbm2oNk/ENgURyNTgPZNBRNbJticAY=;
        b=nu8FSWyHH1FZNyuwq6Mpjoi8+CgZBwpYUw3qk5tElK0LA1muuaMaWdo/5x6patPHU3
         Qu4DO6gLnCCHClp/6vSOhk57hFm7CbGjM8+/3niSy+E5O4zGaoPaBsYeR+xtB7+tNJep
         vDbYKftLSengAduicPCIeosiGkOo2NM8hUKsUqqNzhpMsKxnDzD30aO1e4QT8gfnpEF0
         VZozWMAHX8oldAo/7EDbi30sefWIcIGSWHbGYzLez7RMR5m0gvhGO3nfGQgr0g1ScXy5
         68i+v5phsfPoSYZ1lBNTnnLk5UQw/1bR0S7DCajDoLblNlW3WTPdQhDSrhqnG7GL5frn
         wZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz2nU31fvhi+aJSOCyk23//rHh6SBiPVDxThVKG+rSH+DJroYI3Hbu2+L/7Vtr5OWVVAZwxmIjeOfMzZ6hjqxQKG43BJ8rpiAj4/WeARxMEmbE0cHkmblIbcMgFtTd
X-Gm-Message-State: AOJu0YwZJFBs0jJeeRKRVwsKQWTD4puoMdxxJDJYlK4bwbaXEqyZAVKd
	BKxTMqnMmmtWZz3aiMR9re7ARrJ9rduEBfit9uA4T3JzI37GTsmA
X-Google-Smtp-Source: AGHT+IEs8tUVdKoi2mlhhy5URJvruIz2li73IDosmzzBsr5cpVJfDlDP8mmFYdDbcMsYsd+UzYor9Q==
X-Received: by 2002:a05:6602:2ccb:b0:81f:9468:7c3c with SMTP id ca18e2360f4ac-82253855ad4mr253501139f.12.1723130488078;
        Thu, 08 Aug 2024 08:21:28 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b76346af44sm10032073a12.30.2024.08.08.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:21:27 -0700 (PDT)
Date: Thu, 8 Aug 2024 20:49:31 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: laurent.pinchart@ideasonboard.comdan, dan.carpenter@linaro.org,
	m.grzeschik@pengutronix.de
Cc: dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <ZrTiA8vpsHyGWp72@embed-PC.myguest.virtualbox.org>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
 <a779ee26-fe93-47ac-a25c-b842534e0317@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a779ee26-fe93-47ac-a25c-b842534e0317@suswa.mountain>

On Fri, Aug 02, 2024 at 01:40:48PM -0500, Dan Carpenter wrote:
> On Fri, Aug 02, 2024 at 11:32:47PM +0530, Abhishek Tamboli wrote:
> > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > and uvc_v4l2_enum_format().
> > 
> > Fix the following smatch errors:
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> 
> When I reviewed these warnings in 2022, I assumed that the error
> checking was left out deliberately because it couldn't fail so I didn't
> report these warnings.
> 
> Almost all old Smatch warnings are false positives.  That doesn't mean
> Smatch is bad, it's just how it's going to be when you fix all the real
> bugs.  In this case, I just decided it was a false positive.  It's
> possible I was wrong.  Other times, I report the bug and the maintainers
> say that it's a false positive.
> 
> There are some old bugs which are real.  Sometimes I report a bug but
> the maintainer doesn't see the email because they go on vacation or
> something.  Or someone sends a patch but it doesn't get merged.  Another
> thing is that if a bug is over five years old and minor then I might not
> bother reporting it.  These days kernel developers are very good at
> fixing static checker bugs and these kinds of things are pretty rare.
> 
> I don't review old warnings in a systematic way.  If I fix a bug in a
> file, then I'll re-review all the old warnings.
> 
> If we decide to merge this code, it needs a Fixes tag.
> 
Hi,

I wanted to follow up on the patch I submitted to address a Smatch warning. 
While I understand that this warning might be a false positive, as mentioned in your 
reviews, I would greatly appreciate your guidance on whether this patch should be 
merged or if any further adjustments are needed. 

If we determine that the patch resolves a real issue, I am prepared to 
include the Fixes tag.

Regards,
Abhishek
