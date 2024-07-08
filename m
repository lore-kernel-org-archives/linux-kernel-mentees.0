Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12A181AC7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720437954; cv=none; b=FNkFVN6xIhFrJ3g0isFifHdMA9DUSDADWkw5RNI9QmZiOsNSFVn/ZjHJn1EaQ31O+GJRggrwc6geo6VQawJZim8/Ss5l8J/mq1QR+j+hPAs8UD5dWTvmDtjrI8SpR9dHH9UTcwd6+kov0ICOXQDfLUrl42uQSHksC4wMlSeVeVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720437954; c=relaxed/simple;
	bh=iKpwXvhbB0qXDjkBNWkywakk5y4ndG5jn1tceNaYV8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TbXWDqsmIl3cRoPJdzVfVhzw23piPD6HK7Kynv1w1QmvI5ts4OFK4lAldmrFtUOv4OigPPgBw0ULmhofWeE9xh91CESDOLg5eoutnLvD09XOKhC6DEHrVdR5Ffo4IM7iimcZ+aYkfGzQebCOTHry5CuFjqX9O7MX1LUixTJJL1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DSfXynwN; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DSfXynwN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 705A640AC4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIjCHbK2jdM2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 11:25:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dakr@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 421BE40AE8
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421BE40AE8
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DSfXynwN
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 421BE40AE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720437950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxDEKjje7ewX3dmdPxps0vgNGDNpfSpWeAQAGsyxyvw=;
	b=DSfXynwNayVAe/V+l1hTCBt/YO8lGXIT5s43gyMjgy6b+48kNF0dtIwQ7Q2EOJ3T9+gLy8
	1PbX+3fuYjAY42EUScdBJb9O5cuXgs3VkU2RSLIWiHi+MF6Uwxyc9ZW0LNVKt2Eirwd/1X
	jTPFLIJ6FiNT4p+b68u/KAbXTdHeMY4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-Ah5LaaIPMPyYrOOGPFY7Qg-1; Mon, 08 Jul 2024 07:25:46 -0400
X-MC-Unique: Ah5LaaIPMPyYrOOGPFY7Qg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42667e82901so6486605e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 04:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720437946; x=1721042746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxDEKjje7ewX3dmdPxps0vgNGDNpfSpWeAQAGsyxyvw=;
        b=NSesLWqgVtlpV82ahtre4M0Ldwhum+6hEi+EdpsXkj7GGqwZBYIPa+rF0w2iiavuuo
         0qANPSB+UceQrPZSiqRkywLFZPOC7vEY7ktz03Ufx0sAmZN3RWaMOfsU9hPjPSGdIjyN
         PjO9RiMokyJBcDTob93dNkcth3Ofh0UW68xGE2iCWDsnLLkAratuEjMhaHf+p6u3s/TR
         EvBKiaY3rJgk3IliezAbtbzAjUHHNneyWRjocmm0dyFs39qeJkTeAwucKHXxfLVfDURv
         4DlrE+/Prr6ouUBhEhn/Qnl7qVWGzNbCpkq13e8IVJdcLKTdmzbdair8ii1oQ4nzapTs
         te8w==
X-Forwarded-Encrypted: i=1; AJvYcCW4Cfd1OrMHu3hp3HvVAJV09tjisBTY01JeJlVrjjCDDJnBU1oowXm1TdF5l1FqM9zQEGPGbWOSM4PkcYfd7RFbA22mzgNgWOX73n1vnHonv8Q02g8GlbTMFuOaEmPT
X-Gm-Message-State: AOJu0YwtF2tWr5g665KMtHkzYVmQ/z2kpLwbi0P45cFi9IH7mXyfO3yD
	MF0r7cHska/cHuuVugNJLdwpeeJja7jz48aLwudSVBKD/K7ntC/r1xe54qsKXKI5f8FauI23842
	MwnjOGhDeGCc2EaznwTiosr3ewNI1u2hNtY38pEpaC18HyCIs2htEfSKwdyvh9dDo7YoDemqyxI
	9N7dHmXJp1WQ==
X-Received: by 2002:a05:600c:5493:b0:426:6ee7:c05a with SMTP id 5b1f17b1804b1-4266ee7c253mr768375e9.15.1720437945917;
        Mon, 08 Jul 2024 04:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFleDfM0VAI2FqOfDLpFDYDHHTu1E1XX5kKYuAnqPX8YzewfdIeXDRmz5P8FtyDaahi97NdSQ==
X-Received: by 2002:a05:600c:5493:b0:426:6ee7:c05a with SMTP id 5b1f17b1804b1-4266ee7c253mr768125e9.15.1720437945583;
        Mon, 08 Jul 2024 04:25:45 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1dda61sm162052725e9.19.2024.07.08.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 04:25:45 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:25:43 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: firmware: fix invalid rustdoc link
Message-ID: <ZovMt7AHJdiGEobg@pollux>
References: <20240708090615.2267476-1-andrewjballance@gmail.com>
 <CANiq72mB3hA6GeN2XSqRpV4m+rCbr2+NLHgmfpphjm1Wo1wBBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANiq72mB3hA6GeN2XSqRpV4m+rCbr2+NLHgmfpphjm1Wo1wBBw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jul 08, 2024 at 11:16:34AM +0200, Miguel Ojeda wrote:
> On Mon, Jul 8, 2024 at 11:07 AM Andrew Ballance
> <andrewjballance@gmail.com> wrote:
> >
> > rustdoc generates a link to a nonexistent file because of a extra quote
> >
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> 
> Thanks for the patch!
> 
> I guess this is meant for staging/rust-device, but I think this should
> be a review comment here:

Firmware and device abstractions were merged in driver-core-next.

> 
>     https://lore.kernel.org/rust-for-linux/20240618154841.6716-3-dakr@redhat.com/
> 
> Cheers,
> Miguel
> 

