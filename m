Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71BE28383
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 02:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708483179; cv=none; b=j3uuegfhu2hGOcoJHmb5wx1VLW/F/bItMnr2yayGY8BX3m1qYtm5FLFllXK6UCkiAebr9jcqi6aTgkPkNvm5kpz5XC4JbnI/slsMwanAEKGuJgr9nBX97m9Hw4ScXxamyqs6WtZr0Uw/9b7aB/783v8aP8Fv2WQ11nzCS0DzKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708483179; c=relaxed/simple;
	bh=VPbKVByFJjX349MDKQOIWBVjQlbUtiYNqQqrR8+PYLk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=P7lTXrZwyMznBGA360EsG7+5Gtp95Jo/V8Sbnqw3sMc3QFy7dp/ysVHWGL8ZyorCdZjL7IsLrg5O51+38mM+o4yltc9AZyYPFkMCuCYsBgbwH/Q6oipG5ccqOaVSHtA8HfjaE7gTLVQ+i9MHCgMd2O+IGcMhsKTqnek7c5urggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaeC533P; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaeC533P"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F53C605CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 02:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrwEfMQXJxqA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 21 Feb 2024 02:39:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=zhangwarden@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F18F6605C2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F18F6605C2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PaeC533P
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F18F6605C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Feb 2024 02:39:35 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7c4949661a2so240437439f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Feb 2024 18:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483175; x=1709087975; darn=lists.linuxfoundation.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPbKVByFJjX349MDKQOIWBVjQlbUtiYNqQqrR8+PYLk=;
        b=PaeC533P1s4S0icPzF3j/aPFn3mOOqP29wOMgErmnSpqG0UHcPDXT7YsGwJgXq2RiD
         aU2Sxad+pXeG4hh5zx9wEh7OSKMkvbi9na7nJPPgNhJwUqXt3mzxJYmjV02+arPLJrus
         2zgW2sBxBAysjxSc7PcWFV+xRiZ50I3mDclsbTRBjYMMepHDef9+vfQcRQ+jDiVXORLs
         v90xODlyRoAw5E5npJfDHhg2ZcuwgUDot6jVIEkMCfKJaSGzIdH+yp2afZCGule8J/sI
         aFEX+4qEJN5Vx6rmTgUYUg4QizB6xW9HUxTyO27Hc7bDKm12PbbtpSsuTrNZOzg3Sg+L
         NoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483175; x=1709087975;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPbKVByFJjX349MDKQOIWBVjQlbUtiYNqQqrR8+PYLk=;
        b=NPt6FDQfnV5cwATewCqOuzwtCsCJio6rJy4xsS9bBH957XdQ8X+IfKCi2XqiPnM65o
         pg6p+u7kQP3PpBXo99MT3t4FjTKhiTPDsRIW4njyuprq4vNh5/+dMQIExPmtoI3Aeh/3
         /LFylM4SI5WvM3rwxV4KWr5jrkJJd6Xl6sGUnOqMCkX5v3hr+2b4Wfktx3wXXqn6winD
         r4OpMi8vlzfQ35bKOdO2ia/75qO7KSo3OFYPDEctDrVS7wsYK3xgfWGU4bH1UPqbwMme
         rqHCJ7SeGWTaEsPt/4QFYblqYQ4QqRH8b9TxEyZYqaUcqSaldGRmBiikFm7qGTCeox9j
         mRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa3n6mFmCOfe1om9uemQ1hNky8jgB7O3tByOW4tdbDTt3/mO0a27I4mLc5p0f/0P0yzUl60mrKAQ0okmNuPhEGEQHfAqLOeBmL0TizQanksvMjZvcurmfPI03agTd2
X-Gm-Message-State: AOJu0Ywfh+/L1Wzf1TkLuAhzM+W4XCCcxf6BAuQL2Fj8yAz9F5K0P1on
	H0aiMJ/IBbTaoqEFlfuaJjdR2/oG9UgdJVik6mfrKcjDU9mROb88
X-Google-Smtp-Source: AGHT+IGuUub5cu04oBsjpRwTFuIrjWyna9xErnVuVXETJA1DYvMTEPcDIDN+QO5gMxTkrhhgIabvrw==
X-Received: by 2002:a05:6e02:1447:b0:365:2247:a04 with SMTP id p7-20020a056e02144700b0036522470a04mr11843477ilo.9.1708483174810;
        Tue, 20 Feb 2024 18:39:34 -0800 (PST)
Received: from smtpclient.apple ([47.254.32.37])
        by smtp.gmail.com with ESMTPSA id b10-20020a056e020c8a00b00364f32170c8sm3186767ile.1.2024.02.20.18.39.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 18:39:34 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH]     Fix implicit cast warning in test_klp_state.c
From: zhang warden <zhangwarden@gmail.com>
In-Reply-To: <6fcd7da4-f7c1-4f2c-9214-70ec77443572@gmail.com>
Date: Wed, 21 Feb 2024 10:38:56 +0800
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
 jikos@kernel.org,
 joe.lawrence@redhat.com,
 jpoimboe@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 live-patching@vger.kernel.org,
 mbenes@suse.cz,
 pmladek@suse.com,
 shuah@kernel.org,
 skhan@linuxfoundation.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B052E4A4-3652-452F-B4F9-F36860143CC3@gmail.com>
References: <6fcd7da4-f7c1-4f2c-9214-70ec77443572@gmail.com>
To: Shresth Prasad <shresthprasad7@gmail.com>
X-Mailer: Apple Mail (2.3731.500.231)

Would you please pasting the original warning of your complier?=20
And did you check your source code if your source code is the the latest =
version?

Regards,
Warden

> On Feb 20, 2024, at 21:20, Shresth Prasad <shresthprasad7@gmail.com> =
wrote:
>=20
>> What compiler version and architecture? Are you >compiling using =
flags like W=3D1?
>> I would advise you to always add more information >about how the =
problem
>> manifests, and what you are executing. This can >help to nail down =
the issue quicker.
>=20
> I'll keep that in mind. I'm on an x86_64 system with gcc version =
13.2.1 20230801.
>=20
> I'm using the command `make -j15 -C tools/testing/selftests` with no =
additional flags.
>=20
> Regards,
> Shresth

