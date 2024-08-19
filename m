Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F0171E5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 16:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084755; cv=none; b=PMHM/tr+8ZSSxn1wEgSlTMsbEidmNV2gQi6+11FNcUhkTsQAs9lwd77tPdiaqFyWL7hNHju6FaEGSjYYVXXaAta3dMbsdE/j9JWfUKLuiXacPWamWlItPtNCjG4abRRg+Z1WZ+Kh7P5cyvGEcLvj7Oqie2ml7Mk+dSv2v3DYQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084755; c=relaxed/simple;
	bh=7NqWr36HuVT4OotxGSUjFuV5V7CFfE5R2Y8n4XuSnJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWbOHUuOaKUb8wpZVfqVp/S0D7WbcvlSElGH8UNAl8D7L3HIYyKFFaLTRDOMfBkGH+gksvbXW1Asu+vp3uHHmViNQZalhAF0EakEMrmBNsIz3iu6ZZ4WxVux8ZkSptvofve2XHlXVlFW6jNLIAIlSVTak/RN7zWpVYuz4Abp9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2636480D97
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 16:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.842
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQV9mzaE4pWf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 16:25:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.48; helo=mail-lf1-f48.google.com; envelope-from=wens213@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44D6C80D90
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=csie.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D6C80D90
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 44D6C80D90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 16:25:52 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5320d8155b4so5993181e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 09:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084749; x=1724689549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tHGsPt2XMV+DbbdXwYM1UeT8GX8eWUBRSysGoQM7AE=;
        b=AOBARy2fwAvvArkhyEjxmOJPK+0qdh8bVLd6e1wwop7s++m1FZxrRM3THPcz5UQUhv
         VKsY77kCRhOa+cTbhSKJqJtluTlFLvvqd8B1EpDQLHDS8s2De9L0/DVbLEs4dct5K86k
         +ebnr6xBRw2ZfIQQ/VY7C4AaQrTAIaBe8Y3rIbYNPvVClf72YMhm/dR3GDZCWpCwQ+z/
         +mMbCtCW5FPGoQuKE3o+o1m6ODwBX4jR4gYqrSedGYiTGUPrSWT6bI32VVqJL5sl3E4Y
         ePF1JIbxypJIIWnFQOCI7WLk5iZGncsmTwLV13Fb+qlLos/rGjDjLg69DnB5i89bDY/y
         P95w==
X-Forwarded-Encrypted: i=1; AJvYcCU0kq5C/LjcFYbPXH680hqqM61LNy0vVXLmwerckNhU+6G+KHB02Yq2KFl5fYXqHg625wlaxike6uUK3rppjvjhLrrmKfa4BqnOHwvYYdSIwhMfjPz32Sw1fpkivCNh
X-Gm-Message-State: AOJu0YxmiwjRC1X2NfeB7+2x9ys2ztEBkc56/iVW5i0eIMNrhJ4pRWaF
	U7OEAPvnZU3lSlw50m3UWyU8yU2oDCGt1E2gr4uFAvtCchBEu92D1ECNqPJy
X-Google-Smtp-Source: AGHT+IGYKqYUzIdMuZODNqc9kNAgpXJ3fWdOMp76KzwkG2p7MBIn/rtz9/OxRushZ6M0N2wsCSAX0A==
X-Received: by 2002:a05:6512:6d6:b0:532:fdba:e7c9 with SMTP id 2adb3069b0e04-5331c6e3e9bmr6610456e87.56.1724084748476;
        Mon, 19 Aug 2024 09:25:48 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d424fb0sm1553203e87.281.2024.08.19.09.25.47
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so6546504e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWd3YUOapGsUwxEC98A3SUugzoxZDFRANvoeGxXi0e1B4iQJKsBMvuJuDR0h74IdptdClbQ3qF3FgfsFLsVdOd/0g+75yY0W7OyQulOM9URKfr8Rl5g5aPxSO7LzQP
X-Received: by 2002:a05:651c:504:b0:2f1:56a6:6057 with SMTP id
 38308e7fff4ca-2f3be57849emr72731681fa.7.1724084747357; Mon, 19 Aug 2024
 09:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240816171129.6411-1-abhishektamboli9@gmail.com>
In-Reply-To: <20240816171129.6411-1-abhishektamboli9@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 00:25:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Subject: Re: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	skhan@linuxfoundation.org, rbmarliere@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 1:12=E2=80=AFAM Abhishek Tamboli
<abhishektamboli9@gmail.com> wrote:
>
> Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
> to address the checkpatch.pl warning. msleep() for such short delay
> can lead to inaccurate sleep times. Switch to usleep_range()
> provide more precise delay.
>
> Fix the following warning from checkpatch.pl:
>
> WARNING: msleep < 20ms can sleep for up to 20ms;
> see Documentation/timers/timers-howto.rst
> +               msleep(1);
>
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
