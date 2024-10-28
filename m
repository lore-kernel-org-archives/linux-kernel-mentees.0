Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B61DF749
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730139110; cv=none; b=SkIlKsgR5NDAx1X4GAhvTgz/BMaaLu8lvkWtPp2mYqyzlgBut2MYk2e6XRrvEsyDeUF4oKJfAYcfuAmuQXTC0edSSfhTJvuMKKnKZWHte+yBQh1UEuhZ8jqgRx4M1pM0tSKycHr5Y2aUwzm/NrrRikUFeNRjdCVdMf1x8m5YZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730139110; c=relaxed/simple;
	bh=fbnLJGdBoUXkG4F1kWM2e7N4J0NhnGUvlbGNvY9va5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMwAgl8wnA6tLuKVbU/PZ/fJmd4Z3TOtCiRSbYAnF5EjdhgyjmsMUXRSa1mrbFsMYwGU0JelhN1lQRXljtDZc7Uf/AU0YuvyFrtAzFpJeyKU3AdRwWUfnUlffJosg2XcchG9H/WwP8WNJp3GVZZHve2SXlqmJxHh1NkSTK/0Rrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a0xZydge; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a0xZydge"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE8F402A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HbrNbtSvgDQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Oct 2024 18:11:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1C92402AA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C92402AA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a0xZydge
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D1C92402AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 18:11:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53a0c160b94so5139521e87.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 11:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730139102; x=1730743902; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=;
        b=a0xZydgen9R/CGv3OcUULz26BhOf+CDcOQwKc7LLWsWaRrZeTQqjblERh/7DCirsAj
         81Fw+kID0rtL+ZffGIi5bjoEO+hfkjfHHfiuu9o1fk5WehObwgj9+NxBdIFk/q+CiYZm
         2EuPIheviNDBRMFhsTTLsVPqvXTOSLL4TsPqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730139102; x=1730743902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5UI8Ycq46pSTtV4R594ykmuHChRzRyHTc8M42JBCVc=;
        b=CZthmfSe5ct8ME5REZQRm1JR4pwWD0wXYxkQ6thVvkuWsKZJaPVSf7b5QNCnNtbisP
         qUqfcv389QiLi6yg8EP4JUiA73/PLIDK4hZjA5wy+z++xsP6+L1vLJQrRmcPG/UO4tii
         0rmW2W7P9jEXZsEL3IQGp+8ahzC8pbV0q/euxCyqd0LmfQoCwOuChculE7yXD/YaRuoM
         m3omwscL8mZNR7TE6wlm2b4zxjQpOwmPBK+CL2mkG4d935qGW+FTF3H4FAmY9hhK/Xix
         FCCOPAlPOUn3+40cUw5vHmbRFVMIZSrazNP30CaTFkTxVEIiOgTlU9qKQ7FrkaD0fsh3
         dxzg==
X-Forwarded-Encrypted: i=1; AJvYcCX7pYo93tcSkyYN4Zg1oVA+/hE8oMOXN2JYY3F9vAEAQsyiCS8koT+gGAGm/aT8OXtNO6VN+qQdf9OAFJ/EgvkeZufEyg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzjAcw2kv1vpneWBHldVAP81VNemRHoy7Vh42Ogyvx9oX9CKFhX
	HCJcR5lK3g5V5hQo6fMaVOQ0TrsjGdNnkSfs82C47cOqxxDGZFQ9NmSgHRX94r5lsIJS5B32NA3
	4Bg==
X-Google-Smtp-Source: AGHT+IGxLPkraVYremxOLCugviPO3Osl6Nd33aIAAbntG8nm/OiHMpmSt/hdIt0wsZ8dTd7IRlx8AA==
X-Received: by 2002:a05:6512:2820:b0:539:e282:ce9e with SMTP id 2adb3069b0e04-53b34c35eeemr3035267e87.60.1730139101999;
        Mon, 28 Oct 2024 11:11:41 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1ad9dbsm1144643e87.159.2024.10.28.11.11.40
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:11:41 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb599aac99so42206601fa.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 11:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwe2ssZA5QAXEarr5XStCxEv3DJkoKYCYQWmoGT9l2DqNokn1Uea190hrCjtMGfGjET4SD3EGFfqHkdg2dWAeoUIvivQ==@lists.linuxfoundation.org
X-Received: by 2002:a2e:802:0:b0:2fb:2bda:3872 with SMTP id
 38308e7fff4ca-2fcbe0ae3a7mr28225301fa.45.1730139100482; Mon, 28 Oct 2024
 11:11:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026144724.GA892311@lichtman.org> <20241026150040.GC892629@lichtman.org>
In-Reply-To: <20241026150040.GC892629@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Oct 2024 11:11:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Wg9fC7eqhV7sAy-QK6+oE49v2nY0+gnaZpDeA=kiAQ@mail.gmail.com>
Message-ID: <CAD=FV=X4Wg9fC7eqhV7sAy-QK6+oE49v2nY0+gnaZpDeA=kiAQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kdb: Remove fallback interpretation of arbitrary
 numbers as hex
To: Nir Lichtman <nir@lichtman.org>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-trace-kernel@vger.kernel.org, 
	yuran.pereira@hotmail.com, jason.wessel@windriver.com, 
	daniel.thompson@linaro.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 26, 2024 at 8:00=E2=80=AFAM Nir Lichtman <nir@lichtman.org> wro=
te:
>
> Remove logic that enables a fallback of interpreting numbers supplied in =
KDB CLI
> to be interpreted as hex without explicit "0x" prefix as this can be conf=
using
> for the end users.
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
>
> ---
>  kernel/debug/kdb/kdb_main.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
