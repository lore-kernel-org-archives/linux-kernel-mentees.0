Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57E397936
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122631; cv=none; b=e1Q+J+PELGime0Pz7uzNl/85eAD5CUSo3xWATiDx1wBcrG7U7sBwNlfpQE1hhuUM1U/SHyUaagqq3DzC3LEcPKssNP7lu845EYXhFy/dJNPy1fSwhUE6RqqTiRFn0Imt7KJfyMYhnAL3RiCSQ4Pbh9hTCc1auF4jA+cWKtGNpaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122631; c=relaxed/simple;
	bh=TmlLgISAnr4rRqg/Ayqw9Wq6LM6PY8bUYPc/LdR0qDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBhJ5bcXaFIT7i6WbqSUOETshUcz0/vJtIRSrXjbFpz50TI4FDsWVHFNuHMkrMDfQ8KYr/jTh+Bx0/fsWflYG5S+2YjsH/vQDfA3+mGsPQzkfWyxGJrrDZ7NGhepOZdQZjSufLp0u6DJQTwc3Hj7K/3XnmcxACgLugVzu9buGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXQuTnTY; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXQuTnTY"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2071180a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122629; x=1786727429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mE3O02OMWkG+4I4n64q608gMiInuxyO9qbByZw9c+TU=;
        b=QXQuTnTYoRFYLEvl0+R9XTBNpD6VjUHxBpxw7swcmU81u71OxfnfZNLaKRYRtHXtLt
         3zgkeO7POkfvosluXAAlBRcnhgQo/Es0MCoIm45P1gt8ACNHIelhbnXV0PkzBnD8hV2K
         SiZGbY3bPD4/cm34WFocSliP+OwiZ2XZupz0ytvrxSe1uGRvmBUJfzKeT3vWu40534ZG
         n7FQksQW72yFmJkpAZELvMd3Th85XlZe6wVaGLSt8aAenw9SpQX4PAWxq+eflEWS/Xjj
         3u7W3ahO/u3lH+9cbtyxhj7uIVTlf3DEJVo/3ggUiivzAcjsvVsExQWtO9Fsr8/G9mPk
         YUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122629; x=1786727429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE3O02OMWkG+4I4n64q608gMiInuxyO9qbByZw9c+TU=;
        b=cHddfEOvooXhZVOdsQiS+5SgD98LxczH15SvrINeYNBzEZrv0wKn2F7LbrZdKTaLCz
         qxNxXNemioYsSrSZ3McPZypLY8y2t4sixJPRS8NIQRLGx1oAZkZQH9ZtfYRYl2ByzBsx
         FeRCrD9/UEPUB4I4WMnDH/xjR0hW9Noy2eHeuOJ2fzwIhdSJCIDpb6Lmdhb8146zdyxY
         pZ9FnmW9gawvzBmR9hakkVtF1KQkFSK4J7JV/kiGh/y+UnDFHIxzRySROXqspVyOHsYd
         n/ESKylGW5ndmyaafJgb6fK26kucVimm2aERgeAM6+IAvfIccrR/X+itjGDqO78WLZx6
         5vTw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Sx1M/0ipaXg8FzqW7NpdbgU4mXj8/yfBdqQ2jsOtKTKotBX1PvSn312UjIliYd/LoT9DwPLQbFDpMJs4nWIMMwnACA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys8dZlY4Dolh4GYG585OQ9UcFGoDvPzDDRXMd3kf+hzAdWz8up
	QYUfdKW9ZXAjtv4dvVwtIx2cWcA7M+EiOlBaPBacrFzRA/HU6oCaYHnk
X-Gm-Gg: AR+sD131d8DcBX7Cx83ufza7H5LrpMbilAZ6tLtKkNXMvEtckTmC7eSPTsKjNL2l1P6
	gKFz/zXENO5SQysmsOOv4XQEuvozGZpBmRV8jrRs/jPfQ/OSO5l4qoF96I+NJUFQ3kdlt4Cyg6t
	Bj3PHrNweNMuNyhI9EB5a7wqImKTwzum3H9oaDYLvJSglX5zSDISh7a72ZzHAUIt3zc4IENc2xl
	2DdZmAnoWA8MdfeUc8aHTAPVBBXm2Q4fq5t7NxqsBMX4Clz4T/jrbTGDUVuXytew3TE08Q0FZtm
	VRNizrN4/gGCMv93487mmEhgw2EJoyLRv+axTNfXMexw+RibvrVFr6IYc2SfEEJrLOPPxqYuI4H
	OQE9A8NWJbKfnu8WmW4JNr1oe+qllatceYE0oQ7NlwGRwFq+AMtE0fNnPRw+BYWSfZfQKgHmazo
	mDt9Cmu6oJEqiqcrm0rx2nYEM71dcRbruz4r39MycN1G1Gc3UgoZLdjMS5ws0r3gvDhwt7TK881
	e9UAH6LQ9TRH27dgmjbZuD+0O1nR4GA3oD/zGLjvlVzcq5xQuiFgADwp9eTnNeMin7EKShPOV+K
	eAeOezI=
X-Received: by 2002:a05:6a00:399e:b0:848:4d1a:9556 with SMTP id d2e1a72fcca58-84f2dfd0a11mr24731599b3a.11.1786122627490;
        Fri, 07 Aug 2026 10:10:27 -0700 (PDT)
Received: from ?IPV6:2804:14d:4c64:82a2:a0d:ceb5:202f:6629? ([2804:14d:4c64:82a2:a0d:ceb5:202f:6629])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58d82asm1346996b3a.57.2026.08.07.10.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 10:10:27 -0700 (PDT)
Message-ID: <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Date: Fri, 7 Aug 2026 14:10:21 -0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
 <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/14/26 19:44, David Lechner wrote:
> 
> interrupts:
>   description: 
>     Mode control pin can be used as a status output to provide interrupt.
>   maxItems: 1
> 
> Mode control pin can also be clock output, so we could add:
> 
> '#clock-cells':
>   const: 0
> 
> if:
>   required:
>     interrupts
> then:
>   '#clock-cells': false
> 
> I only checked Lidar Lite v3 docs, so we should see if these are available
> on v2 as well.
David, quick pushback on the #clock-cells suggestion:

The oscillator-output mode, per the Garmin datasheet, page 8 reg 0x4 from [1], isn't really
meant to supply a clock for another device's logic. As I understand it, it exists so the host
can measure it against its own reference and compute a compensation factor for the device's
own distance readings, since the on-chip oscillator is only rated to ~1% accuracy.

That seems like a different relationship than what #clock-cells models: a provider is
expected to report a rate that a consumer just uses to drive its own logic. Here it's the
opposite — the rate itself is what's untrustworthy and needs an external measurement, and
there's no consumer that would actually want to clock anything off of it.

Given that, maybe it's better to just describe this rather than model it as a clock property,
or leave it out of the binding entirely for now until there's an actual consumer for it? My
point is more about whether #clock-cells is the right semantics for potential consumers here.

Tks and regards.

[1] https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf
