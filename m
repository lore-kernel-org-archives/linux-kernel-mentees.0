Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786156F2F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724625562; cv=none; b=ovIIGdwc4fNThej2buo91rKbZiWXWDALn2nMlVi9dKa4MfT4JtgEsCLVWrLeUbI9+E14o8wW989cKyv5n4kyjLJjoTlCLp09ryidqIRFj3WAqe5Lk7ofzlf3TNiESZc2GnOLn+FA4CDk2b0hGD4KifCIHRfLxOIbtTPbIViV5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724625562; c=relaxed/simple;
	bh=A8yKiAJiZ9+dK8Dac3BbyPZjFgAcyrIfwBNuirmo8W0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RjucZe4R+BFD1NNO0l9S4l+6EAC78evnJEnFRmO300axW155Pv8CKOzbogOfLwVQoA8jAUaNwdoTwrKHBa6c0uG1ckljcfKJy21uOULUsbP6mLJEDZhkto8O3cF2M5G0Btuk+TpPKHvMka9abBK6ADzf6gNoL16i7+5xZL8jRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmGgbt5R; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmGgbt5R"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E181A4027E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oE2VXFh6tcn4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Aug 2024 22:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9A9240257
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9A9240257
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jmGgbt5R
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E9A9240257
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 22:39:19 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714287e4083so3312767b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Aug 2024 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724625559; x=1725230359; darn=lists.linuxfoundation.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A8yKiAJiZ9+dK8Dac3BbyPZjFgAcyrIfwBNuirmo8W0=;
        b=jmGgbt5RrIkT9wD2QfZaLhaBWOq5259Y2ZCWwQ1QPAS0AlkHHo7K3O6+5fsUcfWfpC
         2BzLhZv6hLQg8EJ2v8CzN/xZY5ZYMuqx2XBwNkb5Mu51hsdAknU4KhlBSRj9eobADVHe
         434Wf/6RdjZuJ6wjE+yVxTc9eyeYmfgTVZIvPe9SXelZHmMnDLc2g5VmfiSDWdmZG9TS
         osfCTdLALKLV5PlKSwMX07eZOQJjYVYUPCYCq0NGsdrxD53y0EuC0RGk/N7zldj4uzwG
         miFQEQkNb2aIPVd8m1WTxZRA69JtwYOkJDvWsB1at2hc2LgDE1Jajy57tv2tTXv8B6Np
         NPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724625559; x=1725230359;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8yKiAJiZ9+dK8Dac3BbyPZjFgAcyrIfwBNuirmo8W0=;
        b=OeF/GSNB6A/aitSIj192Bdkc9i0SULCTLpZAxajqAISgBxjr4+gs9p5b4X+Qf/CY1v
         Xbhq6buDANSwKGxWjptLrwpgJW77ufzkGWkQ6ZTqK45zpun4zBH8EPLfr3O9pUsKswDz
         6I5srOglHCOWc/p4Hzu8oVNupmG7CgUMxv328o+ASwsGGF1tqpjfUlMxL+6zGYgYvuXL
         zFrFHDEDT5RPcS1ghNtUUcq2uwr8cI/PlxT6POj32/Q0QLiIBTfEmpj2qnLOEe4pae3I
         3/v1cIe3HXxe3mTbc44jZOZjsiYvhlVw9BZK3BUdy/+5NHCGxXNHqHJV5y/B0xMW6HKL
         PXfw==
X-Forwarded-Encrypted: i=1; AJvYcCUiQOfXse6Wi4wL2jtaMnbthdNmcMVFrd/aV/zOE21sPvZOke/HPW03t7Ry/9R7laK7sdDdPpOujMMWMdpfEX9hK6P75Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz7x/mt2lUowULw5UfpwE8ofqcRY/H2vftsI1/5BcuypiTdx6k8
	eM8GNJHqmGCxsgq1TPJCCaVekq63uOI1mihgjL8HxBHGH4OecHuZ
X-Google-Smtp-Source: AGHT+IGTR0K3SMhIGJvKAdRaKXp+kAHK75mt1qIKKM9G1s0y55MvSX5N3pASe3f8SLFYYgEOoJzmxA==
X-Received: by 2002:a05:6a00:1805:b0:714:3325:d8e9 with SMTP id d2e1a72fcca58-71445e1153fmr10855368b3a.22.1724625559079;
        Sun, 25 Aug 2024 15:39:19 -0700 (PDT)
Received: from ?IPv6:2405:201:f022:f804:2fa2:fde0:4987:3a52? ([2405:201:f022:f804:2fa2:fde0:4987:3a52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430a260sm6016675b3a.157.2024.08.25.15.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 15:39:18 -0700 (PDT)
Message-ID: <2ff61088a046d49d8afa708f2a5da024604b823a.camel@gmail.com>
Subject: Re: [PATCH] scripts/checkpatch.pl: check for non-permalinks to Zulip
From: BiscuitBobby <simeddon@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, apw@canonical.com, 
	ojeda@kernel.org
Date: Mon, 26 Aug 2024 04:09:13 +0530
In-Reply-To: <f53fa069b9cc24a9552d54c7a004fe6d@perches.com>
References: <20240825221806.253575-1-simeddon@gmail.com>
	 <f53fa069b9cc24a9552d54c7a004fe6d@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-08-25 at 15:23 -0700, Joe Perches wrote:
> On 2024-08-25 15:18, Siddharth Menon wrote:
> > Zulip links to https://rust-for-linux.zulipchat.com=C2=A0can break in
> > case of renaming the topic or channel if they are not a message
> > links (which are permalinks).
>=20
> Why should these links be used in the kernel at all?

To my understanding, most of the discussion around the=C2=A0
development of the Rust subsystem takes place here, and is
frequently referenced in the mailing list.
