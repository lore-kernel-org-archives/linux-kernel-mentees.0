Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8312E52
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpWdUeGl"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3D78400D7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 20:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D78400D7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KpWdUeGl
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dl0csuEUGYMS
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 26 Nov 2023 20:08:17 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D37740017
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 20:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D37740017
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-da0359751dbso2646133276.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Nov 2023 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701029296; x=1701634096; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY/+6Vdf/DK4Vduwgn3n01nTcjhDvzNRLJfMJ/HHsLw=;
        b=KpWdUeGljxUxZi1bNxtbykQ0r0kcRkw7rOe9vqGOR+UrcxCU4QwxwL5CFo4HcY4Dlm
         Y7Zdwu9xRoL2RjB9jV5M3zdpEc4iidgEjy3EJ1vQhoQ42g8CwMFIkAwx+DFBwXZDRxPx
         lBAtIY4dIL2F4OGKKt3PWLHFLLDQ+RfiblbWKFynQ+jjLE7PeTvM6tnuSNcmVp/7yppN
         nBQLTuC75a5vK+sCA3iR2AJJGNoFwrOsle7XARDxg/swAZ2mIQl0dRDPhNs7+80dtj6t
         uXvjUbttzT4Hn2k5h068aVIpfhbu883w4Yhnv/OAo++j69Jf0k89viLIVBXQOv3TTH5S
         0L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701029296; x=1701634096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY/+6Vdf/DK4Vduwgn3n01nTcjhDvzNRLJfMJ/HHsLw=;
        b=D3VKByR3dGBm9I0dJqS+h3slhMdF3oI6x/rPGYDtm+2giSJybHzc8h8yVmYhOSR5rf
         gZ/64ADNjeJ1CbVc5dgWILpymEBRDZrjGd6H5jVepWlBu8RV2yax+6mMUhnQVhnN+eNT
         nEGeSxnGPhbpLlyAzxIacgWqqEWTNREqkyb2GHqVku5jFXHt95oy/KNYL1ijYuxJiLSa
         gavGqmN+biNO+bHsdxW7OxkerGLT82ixLzy/ZA2oZDuo9LuIRK2uPvY844+0UKOmLdNH
         G+0ONfxEKf5hJJ3QqqJTucU38tbcqTguAGqPITAoh23iVpuaot2WB6GOSykOnN8TOOLF
         v+8g==
X-Gm-Message-State: AOJu0Yyo9gD3A8vPR69Tydj/LrB68NQ0ZK7VT9eKvHJ+PFJifXBHCcJG
	Q3KY868zG6IfNsOjEvwWFqGtVm8fgDX3wNUGvEGzoQ==
X-Google-Smtp-Source: AGHT+IFFBCc7DEmI9LRDuJXBegkzaw0XRK2lD9elEp31ICkd9wVkz9h0c066lGIr5re94D7Av79NdJLG0iWp7EOCIMM=
X-Received: by 2002:a05:690c:2b0b:b0:5ce:2148:d4bd with SMTP id
 em11-20020a05690c2b0b00b005ce2148d4bdmr5935726ywb.4.1701029296078; Sun, 26
 Nov 2023 12:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231126103029.851742-1-anshulusr@gmail.com>
In-Reply-To: <20231126103029.851742-1-anshulusr@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Nov 2023 21:08:03 +0100
Message-ID: <CACRpkdayV=KUv4j+af_HSEtz05kmg+g-UTOjENsGuS4xtsdTNQ@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: input: convert gpio-mouse to json-schema
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 11:32=E2=80=AFAM Anshul Dalal <anshulusr@gmail.com>=
 wrote:

> Convert device tree binding documentation for GPIO attached mouse to
> json-schema.
>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

Nice work! It looks flawless, making good use of default typing suffixes
-ms -gpios.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
