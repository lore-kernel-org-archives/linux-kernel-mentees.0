Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2BA342C88
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Apr 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958173; cv=pass; b=RecfSG00Kp50ihqTAXETq3v/zlkaJPfVcFMguBafATgcdNsDGTegIk9U2If16JUIzF1pW500UMLlaZCcal2n5UneJRWD+KcMFspP9QTwcp/kICzicWhBDeoo25Ti/wgRHKGMcKxhdUBMQCXOvLrATdzcMFGfEEsw7R24bJXxqQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958173; c=relaxed/simple;
	bh=esi4JAFZY7P14gamD3fgFViEQxYA2w73zBbzZV45vsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvH8wm4GO0b+11xgPEgnIEK8JTf9+/bzxgpAZwyNgJTCFnY5ecP5gY7p0FpZqSwVzLrLEyPNHfDl6Pa/c6yH5xHIGNPVxbxsPCKEPsPufWmHc2Sg8AJ6wSqv9hV56JeLoCjtiHTh+a+pOmbSvMInt4OGuVr9UcDEAImjOzGIC28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA+Wmd32; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA+Wmd32"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so2713592fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Apr 2026 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776958171; cv=none;
        d=google.com; s=arc-20240605;
        b=kf34m38WlA45NXytONxr0jy0CHGQrBsVfmvVAWiJFDrSrnizCouab0+JB3nRE79gj3
         7ZRkoksVAW/l+hOkQfhXUY6Xn30ETfZdKTrwDlMYXf8pdga1sbX/6zIFTJopF33yukE3
         bM8FABD8aAJBQ1zN5ZndplwudBYFgYX4S++Ob70CQsSm22gYDJ64sbeQbbITqyjHEzsw
         kFqXihX6ITeH6WpDpDo71azm9xczd2WNBf4IaIUo5aSy5rzUZsijU8ZNdgRVCm1REnSW
         rnBWn38dXBlSP2WcdlKG8vdGXmj7VtnqGReyb4y2LG5S2fznYWE9xzXCqkljMzP+Au7b
         WuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=esi4JAFZY7P14gamD3fgFViEQxYA2w73zBbzZV45vsQ=;
        fh=Mfc2Tohd4L6RAczuAYNtYYVidd3eCchGZJdVz595AJo=;
        b=iZonBzHfwNh2ghawsmnAQDDHTXAtN4RYBem2BRwHgcRpKjMFCoQ1DMGk1fGEBSTMXX
         rOllcpPlWKNuKBQ1FYwWg2c5NF7W008UyKemqk2p2G5DLK3NiFMZQHjHWSbn7KHlH4cb
         EJ80hsAWGvSgdZaPqxpbciTE8ePZ30VIj6UqOpBpgBbXz4wIQUBcO2Ax9IBvDFWxwgAx
         eqeOSrVIRlain0HwEOWEw7jLCZlrI1+pJy0fC7CJeUn5t2YRqFOu6I4Vr2lBhEdUJ8vq
         yrBEugdwZukvSyKlPTiMQdN2cTuv5k86hNOaOeQkOUCykwBZMnPAS4i/xRXdHf9KTp5e
         xtiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958171; x=1777562971; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esi4JAFZY7P14gamD3fgFViEQxYA2w73zBbzZV45vsQ=;
        b=hA+Wmd32V/HAOgMsTayc3d6971J19Kcgpo4kJ4xvpPYDxbATOsXmXo/li1TffRTkiH
         GFsScNlTmwINgd45Nkkgg5orjlnjYTVq18aGhjkLb6xjDncUMJjPD+684RDvILp+0+qz
         SHoTBqdGPk7u+AS0OI8WzM39y2VE+TuaEHqkuA+eJLPbtE4yftzdoe7YhnxKL6XvmMur
         FE/2gytAP9GINSvbY5x8yZGWbIm/93yJ16BE9N4irmfEmtvTPcG4HhHO9sTju76diu1W
         9aFRMnzxvSUrPzbsfLOn4/vSsl1W5Odz8meCvFWfw5pq3vfhnzVTQQ8hIegWVheiUgNP
         a1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958171; x=1777562971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esi4JAFZY7P14gamD3fgFViEQxYA2w73zBbzZV45vsQ=;
        b=X5YgZexSnamWJYlI2iZM7bNL6+7gXZ6lZfkoHSpwRI+Dna607yIt/zu+suWte2Tsg0
         oyV7q6xFQiJz1ziGZ4QW3odkLV8E3EATod3sKQGHMJLOD61otFK2yQCTAO+cQeqLp8Hg
         pja28QoyboY1DbVOfcGwOv7QE6vFMMW5mJ2/fS0R7n5UaQYUd7e0aSuN6zB3AH8teofw
         2Z0D4iczMUMhHgQfFpuWNBjsFkUNdjM61favDE3hZZcmRH8MYoKeG67eCwPkMRWPSisA
         LC2EboGAxQ5Kp0TqjvlY5I6xMNFmk6cAXrOpZZ2TUQF6UWDeU+zvi7Zem71yN3W7fDrg
         geQg==
X-Forwarded-Encrypted: i=1; AFNElJ++af1CpAWJuTxgEELC7xjSMXC4SHuM0p1lBa4qZGULrlVbUmXfhgO1zhZMQxO94OBy2J9poYeqFt629NnBzIxKpKExrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKGhUdx0Sam+ExD4fobOq24NBrcv0R+gLoOc7xHIWSSgmTeXO3
	bClK6d9m09fnHgp3H72XKvlvFLTMDeb/7z5KR5J4v60vXHBODx/sm72ofluJvXrW8tePqP0EuAJ
	Sy6e5R8D2V6PF2bMMvNmlvCxkcwcSNUo=
X-Gm-Gg: AeBDievn+7teBNgU4Rd7y9co8aGgnNDCf+90DfSgnL/xGXymJPeffovVPjXW4ZmHTza
	fCDNMPH1WeUWsgN6D+OIuD9rypzoqL+MAkc+WJwNz9IfY8IS1/cuowexP4pbtORLmOKxtZvzfzn
	twCtao4g/bCKGq4NMa4eYazOnQGN8dS7CdNO9Ubx5r9tgwM2yIH1tB9CQ2LKX2v/lXFk71rLcRW
	7l4V82JIwrlpzvnM4TH2hlxcpOLJus4VpJMpw01593NClHROxIHi54BQjzmXbBXeInrICwSHEUg
	rId4updlvrv7Fz6tH0FSmycUgCiByB0gU3BFmA0CsUh4GYn4aYDkZL2JhyrL6gFtE6rEF+CJ9Lx
	SpFUkee+h55XvxVzpODpMYYnr1zR0Ghd+2oDCIA==
X-Received: by 2002:a05:6870:659f:b0:41b:e72e:c115 with SMTP id
 586e51a60fabf-42abf21185emr16932734fac.1.1776958170691; Thu, 23 Apr 2026
 08:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405011920.28622-1-adinata.softwareengineer@gmail.com>
 <87y0j2m1d0.fsf@mail.parknet.co.jp> <877bqbeez4.fsf@mail.parknet.co.jp>
 <877bq9lyk7.fsf@mail.parknet.co.jp> <87mrz25hnz.fsf@mail.parknet.co.jp>
In-Reply-To: <87mrz25hnz.fsf@mail.parknet.co.jp>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Thu, 23 Apr 2026 23:29:16 +0800
X-Gm-Features: AQROBzBmnL-JC9cNkWVdzYxtZCb8HXTQ2QUuUaVK4XGTPvBwS-tLU0t1ditvZFY
Message-ID: <CABZ6vuD8TWGj0RZ8j21VJ0mvQvzcXE0Tr0bWnYENHDUwQ=Pxtw@mail.gmail.com>
Subject: Re: [PATCH] kunit: fat: test cluster and directory i_pos layout helpers
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:
>
> Hi, Andrew
>
> Could you pick fat patches again? Christian's path didn't work for fat
> (no response for 10 days).
>
> Thanks.

Hi Hirofumi,

Thank you for confirming the commit and chasing for the merge. I will
loop in the linux kernel mentees mailbox for the Mentorship programme
requirement. I hope this can help with merging fat code updates too.

Regards,
Adi Nata
