Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4B1ECC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726101929; cv=none; b=C5RkYeh3QpgEMfFbCoVYQKhqd2tjA60icXj/WMidDq8JsYyJn8XfZy56vXY4hh84JUl/24Wm2LkU1Mo8AI6i0JKBrEX3myis+UBzXV+KRloCDtgo/358At90ZLkgniMHf62gWBf2aWbbGkP4lW4AWVOe5Cn8bSOjv4Qy8pzxFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726101929; c=relaxed/simple;
	bh=0uaHx4x1yyJDSLxsboXvUD14IU2KPxprqTlUPWK7cqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI9iBkih8FxuwJQ7zE9qw03sHKnrw4fc1IeE4yPibbShelwlqutASFRQ/fpS82BDYxnHOY6NEmXHzy1tY73rKdCFYWsbNz1fKAWaaHaP5SzjC0ms+rf0/9umzqFMbJxBJoMNxi6ZUDVm6D260ARMmF0Cy9rYpR82lcUchIPAzDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmrdKLlM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmrdKLlM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0616074D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6BA2PYUTCjf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 00:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D54A460736
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D54A460736
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mmrdKLlM
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D54A460736
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:45:26 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso338875a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 17:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726101926; x=1726706726; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXFeEE7MIL9Z9sVBfBbEtID4t2efTNAyYO/k4o/Sl5g=;
        b=mmrdKLlMW+CqBtoFzKwa9oGpFjr3rN509u6ptB7izQoP3derD/dpVb7fya+P5FgwfW
         6+QHyhJx7YkYMhJaJhwFV66U7ytnh8EVLLpuBK5xoTgOvK3dkQ+MSaFjKjZANbpT2Zuc
         YgOfQx6PDVbZYMrkUBw9KOsUoVKTYTw0p1uvvSmtrUD1Yt6MXiIhRirHKRjY0K4TJnYB
         rgzgIzHcEt1Zcyv5S5oQ3aoN6cJ8NQmgk6sROYNEcnwMoH4y8aeVZYtqpiS1Vd4PjJB5
         VLS9MUtbBQRWqfixJGlpEIGDxWMsqBRnKoevHLCsAr0y9w+Q5VEdkONy4h1WnEo0znWr
         a15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726101926; x=1726706726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXFeEE7MIL9Z9sVBfBbEtID4t2efTNAyYO/k4o/Sl5g=;
        b=E1X9GkHD5n4/Txm28Gsq1cQd+yRPpeYoFY8wDODYHHsd+VRjC/kdI8DD0vqzbzpqNf
         yw4m6hS2simfz4wsuNaFEuli3+/F271DZ2BUB18ViO66pDTLj57mJHrbqxoqxuDZyhwy
         rapI5gJq+XSuCIO8qv5138iXGMO1K5mDd6Y2aCLcmNfk4AH/4GG7QyDqaJSiOQGjSrLK
         c8uPOXHP6HXt3tO1DdnmNDJD2lZdlMOUb1XCxiu7RfUwnf/VnJYQaFBiTFxgGL/Blp02
         2gpLQs5VuGUYJzv3NeS768VDXQs9gImRuVxprI5fefdmwDIyoliJkNm4ZQfgRCoTCg3E
         1L5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA24orK3mG3LtdlM5e663hnO1ZSWhAJNZqBD923MC16lOra6o2YyG9ystpof8bJDOa04JbJh0UA+kxYzFqxpizUk2zvw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwrS06Pb9vPfs+NKaTosJoDkOnvlgJnX8Kaob7h7olD7kVnNA4u
	BD2UUTH7KcZXY0o31DS5Q4QDIvwvZbOw37i6pdjgJ2jf09cfDHgE
X-Google-Smtp-Source: AGHT+IEksB2QaBHw7RPvGTa2YA8PRJJaWVzkbYoySyhn/h6Bg3bUYHOMHC+R3N0ppsvheo1qaPCRDA==
X-Received: by 2002:a05:6a21:1518:b0:1cf:39bd:bd61 with SMTP id adf61e73a8af0-1cf75ef29d3mr1140446637.23.1726101925872;
        Wed, 11 Sep 2024 17:45:25 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fe11ad7sm560045a12.94.2024.09.11.17.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 17:45:25 -0700 (PDT)
Date: Thu, 12 Sep 2024 06:15:18 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
 <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>

Hi Alan,
On Thu, Aug 01, 2024 at 10:51:35AM -0400, Alan Stern wrote:
> On Thu, Aug 01, 2024 at 08:54:18AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> > 
> > 
> > On 31.07.24 20:19, Alan Stern wrote:
> > > On Wed, Jul 31, 2024 at 11:34:45PM +0530, Abhishek Tamboli wrote:
> > > > On Wed, Jul 31, 2024 at 10:04:33AM -0400, Alan Stern wrote:
> > 
> > Hi,
> > 
> > I should make my reasoning clearer.
> > 
> > > > > Replacing the variable with a constant won't make much difference.  The
> > > > > compiler will realize that bl_len has a constant value and will generate
> > > > > appropriate code anyway.  I think just changing the type is a fine fix.
> > 
> > While that is absolutely true, it kind of removes the reason for the patch
> > in the first place. The code gcc generates is unlikely to be changed.
> > 
> > We are reacting to a warning an automatic tool generates. That is a good thing.
> > We should have clean code. The question is how we react to such a report.
> > It just seems to me that if we fix such a warning, the code should really be clean
> > after that. Just doing the minimum that will make the checker shut up is
> > no good.
> 
> With this fix, the code seems clean to me.  It may not be as short as 
> possible, but it's clean.

I noticed that the patch has not yet been pulled into linux-next, 
even though it has been acked-by you for over a month. Is there 
anything else I need to do on my end?

Thank you for your attention to this matter.

Regards,
Abhishek
