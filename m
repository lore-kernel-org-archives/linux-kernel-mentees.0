Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC913B586
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 13 Jul 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720882205; cv=none; b=IbakJAjIrzL5/p2vSKMWb2BIyO9jC97I3oAXLfsBKLrQ3Y0LrZ/Ub2FoHhLda6Rhq62HPCaW4wDk2wA0WWp8EIRFZAQ1Kmg7F2++ac6ufLdJCMGyPqK/BHE7yQGCiogRxPU+07KVNKISKNBB29F70j2dyFeuaa+Do44p1asIEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720882205; c=relaxed/simple;
	bh=lvDrQV56tBUXKpSUYxbx5CkTdDccFytAphDjQRZAsLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NVCrq3IQkTv70/hL2R+a4GO1nFR1J2wnNV/fBfa+5B/effZoOlRiIGdXTQPxopuorg3TLlFGNem6ibNY02ZdRrPwJ2UY1fIX71FfcgdUoHYzhDpj8lFkDQlEGOr6RWAx0IJQzIOLTlReqhcxq6sh3BNlvFBZPHHRPkwDu++G7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ip3tOvD8; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ip3tOvD8"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434E640226
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 13 Jul 2024 14:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-vlWLB8ybbE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Jul 2024 14:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dakr@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CBBE4018D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CBBE4018D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ip3tOvD8
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2CBBE4018D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 13 Jul 2024 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720882200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a4AbNjpp4hqCHzZOlyISRcLeMmOnjyeu6DKbsQlyQtA=;
	b=Ip3tOvD8pDIRJ9pmtPtv68IIMIA/8wxIaI24IWGL2cuNtq/WPxvvtxWztV55i6wsSNuAVw
	Y8FVV4x7z3qtkuenlG0k4GxonlqqFqgvFDG3RaerYsB1Rx7otF3WgA7plpIOxnPDOAOqYG
	PhJRPIdewwsrsyn91DcKSLMqqXAVifw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-uG_Zm74aOeSDDS9Py8Nlcg-1; Sat, 13 Jul 2024 10:49:56 -0400
X-MC-Unique: uG_Zm74aOeSDDS9Py8Nlcg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-426703ac88dso19076705e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 13 Jul 2024 07:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720882195; x=1721486995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4AbNjpp4hqCHzZOlyISRcLeMmOnjyeu6DKbsQlyQtA=;
        b=KJ3XptMw+y4MhPQ6vjoYZk9nLG0tQQWz5hyDg1wom82AQq3pMq+U6hjsUelxEyhLir
         siv4JnLuqYg/pe8RzTCmMjpZ9suWPLjFyqTVkJnnEjNISlT0920gKtYwFn1xH4ab6S2a
         Wx6NQD4OupINsB3BGf6cgvj/BF5p8xxeR9Hn5NYzCv2DbaH5qUb8TsIJnrS6KF9OQiew
         DIT9X7e5yWY2H0od3vn5RXnxcoIODjWFhQPfi6Df1zayq6d+q9h+mRP2CL5VXZNZYzud
         FXfJhLF5Pt6zam1YcrAdyyR5WVzbQWlcm85+6t21BQPpaGbZ0W4PUn8HtcWSixh6ueVt
         ttOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJMsPdF9ubnx4jz7plap8L0k8RuqdfIDa7Ox1DzzuLznGDPzXDXK06a7kPElcCsAvf6VqD/+sibjHn/AebsdH5dtgtBSdmicP3VNSvVXXuMQoBTiw9Czf7xTxJIs0R
X-Gm-Message-State: AOJu0Yxm5mioWcXQlzhJi/vX8/CJmieTtXpDuJhdWvXp7SgNCqrCpM1Y
	x3Tx9PSaESdvgxlpsewgs+/UM/eW/OCKP8B0dKgvV1OtWPhAsdSMpFnAeRg22GeSvGKCCUl2tPp
	QzrS8R2tegTy2C81xGaLmtzMJDOZe0QT05J/d01uSrVgeaILO2/aFAzu+0x8mtma6cPhMciWEQh
	kCmyE3FJovIg==
X-Received: by 2002:a05:600c:6d8f:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-426707e2ffdmr97349185e9.17.1720882195395;
        Sat, 13 Jul 2024 07:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYybzB01yKZQiOWZSW/pi8k9FrEkZ863yhN5Xt/4doo+hsXQoxYA/zL09HPsKtMFVmYmKhRQ==
X-Received: by 2002:a05:600c:6d8f:b0:426:6f0e:a60 with SMTP id 5b1f17b1804b1-426707e2ffdmr97348925e9.17.1720882194772;
        Sat, 13 Jul 2024 07:49:54 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:2522:59b5:3360:91e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a63449fcsm21716525e9.29.2024.07.13.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 07:49:54 -0700 (PDT)
Date: Sat, 13 Jul 2024 16:49:52 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@samsung.com,
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	andrewjballance@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org, ojeda@kernel.org,
	russ.weight@linux.dev, rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org, wedsonaf@gmail.com
Subject: Re: [PATCH v2] rust: firmware: fix invalid rustdoc link
Message-ID: <ZpKUEKHh6gK7SODR@pollux.localdomain>
References: <CANiq72=6LSGwRsc+deE+U8H=mdgFisrKEPOYgVkZfHhGm8hwog@mail.gmail.com>
 <20240709004426.44854-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240709004426.44854-1-andrewjballance@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

On Mon, Jul 08, 2024 at 07:44:26PM -0500, Andrew Ballance wrote:
> remove an extra quote from the doc comment so that rustdoc
> no longer genertes a link to a nonexistent file.
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Fixes: de6582833db0 ("rust: add firmware abstractions")

Can you please pick this one up?

- Danilo

> ---
> v1 -> v2: updated commit message
> 
>  rust/kernel/firmware.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 386c8fb44785..763d7cbefab5 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -2,7 +2,7 @@
>  
>  //! Firmware abstraction
>  //!
> -//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
> +//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h)
>  
>  use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
>  use core::ptr::NonNull;
> -- 
> 2.45.2
> 

