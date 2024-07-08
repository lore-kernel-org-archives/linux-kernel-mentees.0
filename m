Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA65644E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720437884; cv=none; b=kKDzuzXnGamKvqWBj8/t9rGKYGLkH4KxCdIgMb3Xc5LIWnT93CJEGFAXTbp8OaFawDd4CE2z17t4CcRL3t2oIk05j4p6Q7NEZKthnAHEL8SSzqw0uaON4bMazqrA/9qUpiXc3PrmyPrRjvhRczzisq8LTIwMhgpBRgD/apKG1nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720437884; c=relaxed/simple;
	bh=xTYdYQU1dKWsApIW/T3x4V9sQRMMo94fk5/3o9tWCig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ddtG+R0N92Sp6GWbGTpmrKCvv41DZX2BvxRS8nhD1cdNvvXgB0o78srlsAHmyE1XILNsYA6FG4GyAIVeqQUR89HgnDcbelMhuJLq2AD1dgt/WmJ8SCywTQBtl43M85y/BvpPoEFeXbtzUL/o06pf5tbs0oZnc9FrfVvz8dIPF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWV2FIQ7; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWV2FIQ7"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FB4880EE0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IO8vlnWAopwa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 11:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dakr@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A409780EC5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A409780EC5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWV2FIQ7
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A409780EC5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 11:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720437879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oD998hd8L73BF0lomUfy/e1mUZZ0TqEdQJsnDYHHly0=;
	b=fWV2FIQ7oSc+OuQzh9SXIPTnWIGFSTBMkb9IfoAUwB3wHdytQTOjLOyIEFhcGXXx5KOmN7
	TGUVG/zZr39t7aWLgpl4x4STeReRN4GiHuGcOgvlN2A4Wq9mItI5F8gDXb5MbsPwqwNkhY
	So8/3XWRJaYtI9vGV9GvEZ7+EPKrfVg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-uW7YJGKcPGG8c1-E4s5xlQ-1; Mon, 08 Jul 2024 07:24:37 -0400
X-MC-Unique: uW7YJGKcPGG8c1-E4s5xlQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52ea249d1c9so3746551e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 04:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720437876; x=1721042676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD998hd8L73BF0lomUfy/e1mUZZ0TqEdQJsnDYHHly0=;
        b=PKe9/sVZH+aOWOZaqhKe3COBBfWOLTBTE1ZxNyWDviMXwEfoJYJkHPfZkoP+vfnu4V
         gCEgIMkgrShK2fY0VjGOAQas3iN7qhr4wgx2x15xbOxS9cJFkh1tCv85+L3njiYya4Kr
         t4Qo0l0aqrrV0HEyo2QQqfzsCPiuOuIDgPeNHMdQf38qSJgGfrSYfu5z+YemkfFBymiu
         OzfMBdxojAWu1CansY2msrpWGSj+bZdBUMn4F/FEEVeWiQmPGrAARwcHpd99Iw92HaDs
         ufq+22tCSUzNjxJB++pQukIlmH1s6yymw2EAu7yvEpBm4HKXKitdJrNbTf/DcPD/Jla2
         CTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeT7f/B4MA477j7YCsgLG6ofBTiWVFKfLD92PppfkRn30JOXJT7ibITA5oQM2RXKCU+etLlBB0miQmofgiVT91jU1k9X36YZULVRN2dmdiac2pVPEjglDfJ9sZ5bD6
X-Gm-Message-State: AOJu0YzQjcHkZM9zogFgPcWdxVrZw9T7STDlMnmdJHHloAQlEzSkx257
	Jc9aKineWWQo3jkY/J7CrBpFVrezS855MRjbxw0P1OZMTLqwyDbSQovU1qX0ZKKG7vFOcHAXTqt
	RiF80ujRKb257ZMwE2RIXo6wzaQEEv2ITeUPCZcdQ/6Lf0k1aDhC4qYy8dbThEMiJRlDnbF73qI
	3Qb6xBOusxEg==
X-Received: by 2002:a19:4355:0:b0:52e:9b87:233c with SMTP id 2adb3069b0e04-52ea063ee82mr7486547e87.36.1720437876446;
        Mon, 08 Jul 2024 04:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFdnakvR9pu+5kvWDlp6fmVf2e9irGiK+WfFFlZ3YcSrSy8lWz1fBvfOFHg0op7WTodR+pyQ==
X-Received: by 2002:a19:4355:0:b0:52e:9b87:233c with SMTP id 2adb3069b0e04-52ea063ee82mr7486521e87.36.1720437876002;
        Mon, 08 Jul 2024 04:24:36 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a188edasm160811275e9.0.2024.07.08.04.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 04:24:35 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:24:32 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: firmware: fix invalid rustdoc link
Message-ID: <ZovMcChz-sfSxNRc@pollux>
References: <20240708090615.2267476-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240708090615.2267476-1-andrewjballance@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

+ Greg

On Mon, Jul 08, 2024 at 04:06:15AM -0500, Andrew Ballance wrote:
> rustdoc generates a link to a nonexistent file because of a extra quote

Please use the imperative like you did in the summary and write a full sentence,
e.g. "Remove an extra quote in the doc comment in order to prevent rustdoc from
generating a link to a non-existent file."

> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

With that,

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
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

