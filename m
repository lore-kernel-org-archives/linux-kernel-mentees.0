Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C321E5710
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102440; cv=none; b=H/3S4T4Yn1F8byln+XEw5P4eP0CP6B5EhL5XAhlCUVDgiFswe7jB3zP4FKbbJ3xmgCn8IRztrJSzKrAACIpKGmV/DJYtPgnXrpA2iDOFm6TXaOs/sZIQDNbmxzfnHF99eItj/2CrROyJmT/Q6lBy1oyWKnUwZPQEi55N+OlLxhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102440; c=relaxed/simple;
	bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTx2RQ+ElZUAotBxjWxYOozsACBzr1FIgqx3B5dmU/nXt8xvvzj8XdC0+9gdZW1yHv/OFkoRwjaKIXmMc1HJmA38c3sW5JuYC9fUYDvYjN/kTSCFPokNbeCEqamZRiAppRSPY9aKpsaKJCeGHmk0OMfN5ZzvJgBVHFgLXPj+mbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkIQ8Xlu; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkIQ8Xlu"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31660608A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 19:33:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCOeeR1_MUrM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 19:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE7FA60870
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7FA60870
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XkIQ8Xlu
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AE7FA60870
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 19:33:58 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so523378a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750102438; x=1750707238; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
        b=XkIQ8XlurABbZjOK61QgkZnlIcU4308tt1vkuOtwhOK/ctY8wE/9HFDw9CLknBDSrh
         P+mBp/IXg7JQGggc6L06zSgLd8uh4gr31hkZQACqqJVrlwA/jB2HO/ZKhBNqlsZ4Wp9h
         F4nN5gMcrv7DakiMqJNXlFtrcMTfsngqYcF4+Uci2KmWnFIMjkJMU9bM4l9A3Ca2YmXD
         Fe76ujLASQup85pH7nptn8Uk4/iBbCKyuLnxC669qnqiHRWuaXhWjod5T6YBttukcQD6
         M43bis1FKh2ASjTHN9qDTjCjjA5pR2EiUvEwgnMRHZ8TDNLpGltM+I3VIhVDLN8J1CHg
         3qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750102438; x=1750707238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCedvSrgAICW/jw+EN4TMS/9a2h0bxIMv+L0P4+6084=;
        b=eGL/IfiEi+a7YGXzz0Fp2nlkUP5Cj6EOx5qExNuZeNE42ha3xOnT3rODoysXVZjZh7
         GC1Jnun63CI0dj+FFax1B5mbiyMbYzEXfyR+JNVDEFni5r9SH+E3nr8rHWYC4D1WyA3C
         MFd8hd+pb3num6+soEJXiwPJ0gsb6ZGIGiynwbrDhPzAvzgBBsHalcJlyF4pPl8Tj+8Q
         Z/6/j5TbNftr0Nwv8V8QCG7mbObmDLV7C02Y2veyFmac4T9t3qWld6IHsoTGlgaXrZiO
         XkEeTUaYCwmckYMuxjejRwiY0jceawyhpxjui212j5Zrox0fBzdmcyPoJlwpQ5GFPous
         PrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2XPvWqm1k21eySGGnoqIq74ECAGU817CaYBlY9EzWzkQv8OnbwUeB+H1E4LJHv1D6ak6cTJeX+rj8ny/dmavcGMr0mg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxtGe5uTB6KudUF1p9Wxncra4nWtIzn4DI4N7eIjAsdxJ6JairE
	2zxk+N3kbyNeDCaDC4GwgkOXy24rVXHh2LtLrKlPauW2DHb3fnUrWDr80hgBDtGdVbIxGEzy3nV
	RyUfzRg1cZEEiu9ZpD4Rjns9y7DnCquY=
X-Gm-Gg: ASbGnctSWFj89N4Yztfk05GZM61ZhrAQ2Jd26HznJsS7qLu0cKhim8FXmu8jQ5M5RrS
	MWbFFnHzCTapN57xAkLSjDG45ddDYtyjkrYrv5UPzbm69B8jCkVgd5uKdwBr0TMBDE+wYlE0g8/
	zE6/BGS5mRoV/hEbhO2KLFxdTOSXgsXdhsJQffr03gsmE=
X-Google-Smtp-Source: AGHT+IGX1yTNJn9QjTBq+4djSQclteAYttiWkHLIUTJs1acMahla8Gcc0/uhfgKPFjM8MtLUlrJysId16RaIFIL8I8c=
X-Received: by 2002:a17:90b:17c6:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-313f1befa77mr5972239a91.1.1750102437885; Mon, 16 Jun 2025
 12:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com> <aE_xcV766hQacECP@pollux>
In-Reply-To: <aE_xcV766hQacECP@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 21:33:45 +0200
X-Gm-Features: AX0GCFsppoY2oxS87ex3PV-5TXOb_9kmj3nhJIvD8pJAvmN_kTi_G_nZ26aBxz0
Message-ID: <CANiq72=YzDKUCbkw9tWuSNDSUHPybhVfV+BsA3Ze-1x48=SThg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust: revocable: documentation and refactorings
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	Marcelo Moreira <marcelomoreira1905@gmail.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht, 
	gregkh@linuxfoundation.org, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 12:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> @Miguel: This series will have conflicts with [1]. Given that it does not
> provide any functional changes, do you want me to route it through the
> driver-core tree to avoid conflicts, once ready?
>
> (Will have to backmerge -fixes anyways for other patches.)

I think the conflict is not too bad, right? But if you need it this
cycle anyway for something else, sure. Let's see the next version...

Cheers,
Miguel
