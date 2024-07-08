Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC854F8C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430210; cv=none; b=RbS+EzxXQY79rbTqMl8t8Hy9ddoCfmhMxy7FJr1uxYJPo836/OhC7E2a9q1DNZxSy36CG2cTaaGxKkRtZQK0/mG7mnKPQ9yLbEI3Niom/4PkZu0p2RBacLllg7WZSlgfygm2b2M5q95Y9yhbepF3q4pK0IT4nmKJ9bNcMQfntOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430210; c=relaxed/simple;
	bh=2V4N8nJ37tLEvQApDYOWQg4gMTHKYKHF0mA5M+vKsy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rn8cYxaVS8AVidPlD77xCXDOLd3MQwIbWgCF0ZcaephEsgUxlX/z4kD+jUqmMe24oXFVg3dw8AtQ0tIpHF0OFLaH2ZbiZBZFym74xSYeikJnPuivzeCEuSYa6gXtW/CqyEcfRdCfhj+w+6IcXf+leDXsxX6A99oDNZeGXGjODUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1LdoA7B; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1LdoA7B"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFED281016
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6fAn81L-3Ez for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 09:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C97AC80F89
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97AC80F89
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g1LdoA7B
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C97AC80F89
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 09:16:47 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fb19ca5273so14409835ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720430207; x=1721035007; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFqGm3yI9OnUkznduf63K0BFhweBnxH+Ps1Ldye9VmI=;
        b=g1LdoA7BTya/gtkYPUOBrCkxQZebX/78xBWEaKnxhPk949ZQjzb9Xmqzv6iBf95bar
         DRwKTNbZWXv7IvmbgbGoiRFb2VGHIvRGgmR4Gk4InqTfxWuEDxpF6AkP1Ay6QVAOV7KK
         H0UYzbU5DK8AYAJxZdKuVyd/Y/ksvlTLROxnn+149rMP+rc+iJrWr/zv7QF5uRBsNxKP
         fl2uijlINzWD5XIHfQvy6MaKZcHTFDrh3ARh7/j3VRPL9NXtqinogFDIbJlovohERGcN
         zhz0/xpGx0a+lTEq+PU/+O1+XGI5WLT9+XGVUWmgpARK3GFgwdiGovMmFodJAcGuDdZH
         ztlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430207; x=1721035007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFqGm3yI9OnUkznduf63K0BFhweBnxH+Ps1Ldye9VmI=;
        b=j87/jlPRs0XzC89D9rcZYChUdlEK3HohhUt+hiHjM8amLNOHomaGQqVUP5ZzBhl0cU
         dzeTBZ2LDfe0ndwb8XmWURLBadsc079akLN1V1KUbb08+AZCYyl/90t+q/haclTgsziJ
         JVPP0nJAh8jQ/qqAo9KDTKBzfjBx7X5TtsZ6cUX31QH8xMdjOYsHmTYbGNlpriv56/m3
         M1MMDY1ehCXbkbhGcVK8hMEQqNCqPAM5oqwBIYW3DREWK9v0Az/v1FnouZ+fJMI+ALgh
         IPjcDfp6Z0x5v6q8nL903J5zQGVJjbTdXcsRx+Jm2BK3gqzhqlZtuyUUOpiSNxdlEkKO
         pv+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmOXxPry6RAQ19+hgEieV1tG8IW4Ewj1Gz2PXPczNrso8DIwmXSlhB1uV8R5pRN9VFuEl5hHECwwn+4YUMoahA/Slk50y372XGanbBUqimBEQ2oDvP/wr8GISaAA5+
X-Gm-Message-State: AOJu0Yz28xImWLjvg+tzSw3KdwCXtzAZYk3KGPuUvWmzmR5e4Ltp2i37
	r57+p5FKJWMwO6a49/5k1jZd9fvmAmHkRtRoVf8YlPh0WpqSnFuwP6KuswdMii8GlhA50l02Zxw
	/TEgn/JQcMssYd6ahJrNNClms7QM=
X-Google-Smtp-Source: AGHT+IHHKpH+Z/eQxrz/DZkFNJgPRTQXTnAdJWL7jTfHsy0i05RsSYMDvJ4Ls32LH9Fl3i9r2bSsKh54jEz6PCJgzzM=
X-Received: by 2002:a17:90b:2890:b0:2c9:7849:4e22 with SMTP id
 98e67ed59e1d1-2c99c69f245mr6261798a91.8.1720430207002; Mon, 08 Jul 2024
 02:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240708090615.2267476-1-andrewjballance@gmail.com>
In-Reply-To: <20240708090615.2267476-1-andrewjballance@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jul 2024 11:16:34 +0200
Message-ID: <CANiq72mB3hA6GeN2XSqRpV4m+rCbr2+NLHgmfpphjm1Wo1wBBw@mail.gmail.com>
Subject: Re: [PATCH] rust: firmware: fix invalid rustdoc link
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
	mcgrof@kernel.org, russ.weight@linux.dev, dakr@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 11:07=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> rustdoc generates a link to a nonexistent file because of a extra quote
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

Thanks for the patch!

I guess this is meant for staging/rust-device, but I think this should
be a review comment here:

    https://lore.kernel.org/rust-for-linux/20240618154841.6716-3-dakr@redha=
t.com/

Cheers,
Miguel
