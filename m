Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA2818FC84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130863; cv=none; b=phzEjnAH8ZRolR2Uf59l0mC2ylwBoPt56oVaLBJbsWK4jXzIBrYTavBPEK/UtNvr7twdzknnoTGSN1Z6i5IruEmPPapeFXredg8crbYfXwC3jDScHDQXaJYvIQuyK6ctZ3KYzCn88v1MXlDxC4IAi0gwEVZRBU8dISi/EH9mmck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130863; c=relaxed/simple;
	bh=PfWOmOcV9l9z+70Q55rh3PrGhzM5r3yXLVKW8y5Tnj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS0Ds2GWuceMSmadk1lEDAiKMI50DSRjEdVur0FTr8Bq1zOfQgmsMDypmsr73KhlA39Sghc3k461+u1qmX3oWqXpHY01AXBvh63FjutJderlcUU4CIfOFbYHZFSJtGCXTu4Y73LtPW//X9gbbzIvNUMu36FvX1WJBTWSuUhTy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMRqOKoy; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMRqOKoy"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B20A40B5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wJ4i3KL7XLH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 15:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1689F407BC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1689F407BC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DMRqOKoy
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1689F407BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:27:39 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2cb55ff1007so969994a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723130859; x=1723735659; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qrVoz2J1yx28Dbm2oNk/ENgURyNTgPZNBRNbJticAY=;
        b=DMRqOKoyXKhKp4nzMpAZcvBdx413Qj2SRbZMX3pFOZlz6kkIK5wp8Mz7u6zILOHMqh
         RmMoDw21he/e43vjtjS0rCzHlVsmalhtIK/5G+xJFwsCv/MmJ+p2xXQ4SlKcds8VENoq
         u7/CwUCTU9eqA3dBdXkM8r1ikfXdTAV+WCI4E5b7nqEmguKvlYzWuIzwTHuq8iJQGIqp
         W3M7ja74fT/XQ1jCBkNpNGnotN9bi0oX+YTV5RlL+BXw82CdRlbVjWNN7xow0SVV6ijg
         3NKeDcFeOPVZrPjFOekpQX/LerVQGbR4MtLDq5ATI7nmuFWHwkFrPP0z2PJB2LFmDZ3m
         Yweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130859; x=1723735659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qrVoz2J1yx28Dbm2oNk/ENgURyNTgPZNBRNbJticAY=;
        b=QxfSPdDJLOccmJsBPPxPYOpXbM2HVh4ub/12vxwUT5nscxVJQYxaSvSJ4EBBKsQ1Ig
         FvlfnTnmS0KfhYfnmStCI3fjCDy51B0w4mcpafNx8SekYhhqU6W9WcXMsK2txNoT+8zs
         qhP3oMxlXFNRAStBo3z1jK4tySj3UQNeynq6Fcv/OOFe5+G34RtZ11gHbtaz4FOy5K2y
         hEhq+VoX7xEbukofwBOuLVLOgWpVuJiyxUZhVKewu6KPrmElnlnrgbyjUFeyr8nl9qSn
         RzkhqObFN0MUbHOVGWr36pkNcn4AGgypM1Ppk451Oy6W0JHjCb5kjX/XmSh0Wtbti+b1
         DtYw==
X-Forwarded-Encrypted: i=1; AJvYcCXMeEHDkWIa8fJH759DYdZf9/C5JlNm4GmZlRpFiY9JVRdVkJD132AzDdO07niB9k7xzVeXjM1IViVrn+olbwQDk/WEkSAETEw/3LkdGPt1Bx69UCi6eZRnMcyOmj4I
X-Gm-Message-State: AOJu0YzzHsrsOkwN1AUNpoL3QEQAYOxZfEAG7P1QCmyaUeIe1ZFfywZu
	FUZFXQwwXd8kUIzyNHpAMGGUYj5r0ABUcWdbVq0c8ukCg0zcFrkJ
X-Google-Smtp-Source: AGHT+IHiHgWTjm1UfRszbp9Jh6b8RCgOFoPHnf4exHKRez7qVshr+dQ3WXNglY3HdV5YdG84WbdkhA==
X-Received: by 2002:a17:90b:3a8b:b0:2ca:7e87:15ea with SMTP id 98e67ed59e1d1-2d1c3459459mr2644200a91.34.1723130858508;
        Thu, 08 Aug 2024 08:27:38 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3ab9b3fsm3638895a91.20.2024.08.08.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:27:37 -0700 (PDT)
Date: Thu, 8 Aug 2024 20:55:42 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: laurent.pinchart@ideasonboard.com, dan.carpenter@linaro.org,
	m.grzeschik@pengutronix.de
Cc: dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <ZrTjdoa66eQxOTqM@embed-PC.myguest.virtualbox.org>
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

