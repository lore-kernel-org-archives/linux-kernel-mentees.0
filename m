Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A51F4196
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 15:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004175; cv=none; b=SLx+LZ4rgmggcZGBczS8aHzD3qw1eqLFUK0QtN/yF3wpCD61048tjmcKXrsY/V9M4nkdMgJNqXnh5q8xpKfWwrl3hCodNYQHogJerobN0ISNFjCA/tl1LyrhWFNjiOSjPBmopKmEVt0sJtxQYSdi8xYw7Z1ZlVcwqADwK92rxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004175; c=relaxed/simple;
	bh=xfSoNr3eqnJ5RCwTzb37h1PBTjnHv67iKD5bQpessBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTDHX83Ymk5quSnOSX+GYJrf77r5bN+5txi2Wdp6cLyPZuHPx7fyZng2AdgZY2/FtEB2tpkyvHm4+tJvwIIUxY3sdLohWWHbEoqEfciCgTkSOxyGNWLs8dVW6nwv1MdnsrnReGp236FNodNBQqPrnQHmmg50w/IMHplstF5VYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMPv219k; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMPv219k"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-303a66af07eso178702a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743004173; x=1743608973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfSoNr3eqnJ5RCwTzb37h1PBTjnHv67iKD5bQpessBA=;
        b=jMPv219kmWybCb+TyQTemjRrIFXqplq1i4XnkI7WrCCamXUJ8CVhYTVcEBJxauCKgG
         jEhDpTa4UQMVi17cQZaEj0KsdVNi5Ts+2NmKaapEQUEEQcLkNSeDOHknvgsYIjfrq1tk
         Iv9eNSJ1PCNbBbEt40GNA8l8y0ekT6ng+U7uL9AsirQ8TZXldHYVqlRUDhZzL1yUySTl
         lhVna3l0iF+uFYWcsYSJ9OlFc59noqHC5Cz7nnWlZLqkXe6DsGY9hAfHFLDLGp7wdSox
         C3CA5Hls+oo+xph6kzESyhH6z00JDOCGeWs1CC2mn3VKSdK74NVkmV4MeXxzy198Wn40
         4nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743004173; x=1743608973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfSoNr3eqnJ5RCwTzb37h1PBTjnHv67iKD5bQpessBA=;
        b=r/JHT5lVV+DfugJPZd+yHtVfHBp0Mk2uI8x3spMjBguWITSYg/Vd3JebtfhlcSB1yw
         HGHQ/t8fFVamjfzzNo3d3tviqo2WGVtUwa8wiyBQ1sMkk+2bdc1LphOpXAMKfLIh5+oY
         2jDf5ZtM0FzzeAW+j/awOoz3CAYoWQU3Rb80ODL98jgq2pe5cHwim4+jrAA7vxqYOHBe
         wt2mhPhJi7p6uh9YOEiF3V+cBUeyjKiN6WNGrE9V7ehRAJhfaNco0cI2koIDVWTHmjce
         FJCcxNeX4LVJnUvbmcGBC+g3kuAAmlRD1N4gvLLZk6CpSMcTyQnIARSuLOoveXLg+gAQ
         gafw==
X-Forwarded-Encrypted: i=1; AJvYcCVLkkkcbxj+dWAK5N6MWZFAlAYUKUhs98nsoDviwiRjrC9348Dzk55Sa17M46sMm91yqkrWIyAVisa87ax3OuMnjJSC+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4P3ki5U1L+8XAMejZEFPoDyhQKEQ4cP2xjMQw1NN9lz0c08mI
	C8skgyRfLrWYeaHq1Xa7O+ce/SiPZ4rG+ivOJ88OLnT9AoAtOLf2xQOpDTwxY+0fHihnQCgZ/lm
	UV9AYEvbLEdXaDqoPkMKL7v+4DrnUOgPA
X-Gm-Gg: ASbGncswDan6VFTd0k3dFf5LPTOuUZUBJQL5bzeGTohPKjcyiKosVVrijIYRGUcBssM
	uHkNs3SloUeOdo10hG1+acymfIwBdHSEFgFnxpXeE4siBdbdPybiBKobxHBGd9/0pHyBqXdzmal
	zn9sYMR8LLiRVZOGamJN/WLN0b
X-Google-Smtp-Source: AGHT+IEHeDe2/t1HeJOiCWOApTTyYC+oMi5AxQ80vsD09PwyUp2vhgb4tzUOmzkLr6YV8c2tHV1fPyQSpWz4c/i1Z3o=
X-Received: by 2002:a17:90a:fc48:b0:2ee:8430:b831 with SMTP id
 98e67ed59e1d1-303a7c549c7mr287126a91.2.1743004172648; Wed, 26 Mar 2025
 08:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326094449.16473-1-nicolescu.roxana@protonmail.com>
 <5F3AB2BC-43DA-47A6-A07A-72540B327D11@gmail.com> <bmjvipermsvb454mdh5zmlmw4gv4oub5fgh4eowedlit75gqei@3or3va3e52ce>
 <MnHJR6KH9EcCqnLtdxKf3XYBSQQbvXWJafG28O2C2itnS_eETVFoDMfVvFva3dkLMZ-LPRWUhG2g_5HBY_lPZkWOYW2aOg_T4YWTrzXmVZ0=@protonmail.com>
 <wdagx2vwyv7s2t2tcndwmambwdhmoitvhmnzcopdl3xkfq6ct2@evmzpxnuhi4e>
In-Reply-To: <wdagx2vwyv7s2t2tcndwmambwdhmoitvhmnzcopdl3xkfq6ct2@evmzpxnuhi4e>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Wed, 26 Mar 2025 21:19:06 +0530
X-Gm-Features: AQ5f1Jr8G5tcVn1-xgCNxwIlPj-jIruCZ0MdYwdAXH_uPIFPKUaVk9tvv8O1vPs
Message-ID: <CAPZ5DTF+Q_-10xF915wF3b3aUm5jqZepqoyivF+G4S6ONf_PcQ@mail.gmail.com>
Subject: Re: [PATCH] bcachefs: replace deprecated strncpy() with strscpy()
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Roxana Nicolescu <nicolescu.roxana@protonmail.com>, Alan Huang <mmpgouride@gmail.com>, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 8:22=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> Or better, a new helper: when we're copying to a fixed size buffer we
> really want to zero out the rest of the buffer - we don't just want a
> single terminating nul.

I believe strscpy_pad does this?

https://docs.kernel.org/core-api/kernel-api.html#c.strscpy_pad
