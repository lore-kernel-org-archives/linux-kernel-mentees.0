Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E6D19F422
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727969156; cv=none; b=LFMWqNplJq278NUuL8kgVlyEGPbFJbq80KdhfCjIbYb7DzJfMgcNFRFUc5K/SUM2jXEdalI4FMFoRbzh6UiYwxuS2d4KE9mhhi8UHFsfVWHjnXJosq5skAY6ILEP05th8ZQcnteCXHUfT1azd/jk4TGqx9qi/PSENg8i3eusEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727969156; c=relaxed/simple;
	bh=wHYrYTAq9GfTjuuBxpXFL41DZQGBb6fSUaexCEp3fxc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gJROfNq/vgvjLdh0TsLsThfVM5iW2b79XS/TDrwyJJNLQ+oRzzkT/yHblXxgSNZ39TzjS5ynzPNa5+HqwNJAJWcEC5j3VaGktvMkwKoezIxyvjTIOzNPIGnMdhjdfOWe4LfqCjh+TTnv1xap4q3KQAL2m2wcjsgfGfvotzDs+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gDK3/ADM; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gDK3/ADM"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8A18407C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUlMY0Nb6Cg1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Oct 2024 15:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=npitre@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5107882032
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5107882032
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gDK3/ADM
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5107882032
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Oct 2024 15:25:52 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4581f44b9b4so7428781cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Oct 2024 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727969152; x=1728573952; darn=lists.linuxfoundation.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eypivh0vKwOLJWDcID4hWN8SmQeA3OueK+WmduSXz90=;
        b=gDK3/ADMF/5H94afHBd1i/4G6zdp1HzuetgF+YkSXjTwg1F9oCRl4cBWUAUmDd5UFY
         1vRfsvedXDRRr06PmJKmpvNI+xz2acLdm8eT0wtpfLYv0UDr37Er/Oy7wotU1l4Bg3Gr
         S2CnBUf+t0nrf+xlCDtsWhafZGVzsGFfcQC9X0lzsiefEhnqXdVrwnWPUH2vT6fMfLag
         iRDqiGlg7nrpR91nz1fo48I3QOHiVG/fP/lWF5k0x1tTPjY71Dn/8iyWctrWFW2EOli2
         7Ligw3to45UE+KTmrYN1UNtdpOYLMtOOv9afwg8AvuxE70c69nq9mwj9nxyxs2o9bNb/
         QKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727969152; x=1728573952;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eypivh0vKwOLJWDcID4hWN8SmQeA3OueK+WmduSXz90=;
        b=COLAoM3dbeCeXGuKvk8fN9Gjp5xS723idmo3gR5FkklOBCnfEZYKMNv5wRC4lLWqvg
         BzRMz9Z3PzI9gX+GFdNF/GuANtHDtjXHTzpguhM1AZSt+iDp+yjvxB50KHndWUdPem96
         lg41uo+CB1XIO2Ww7+jomFgwE7qoWSLmT6krANbeK7cHSBir0EvUS7W2sKSNUOIc320q
         56yb+FKKpkfKb3HfTtgnp0HzaouUy/0jVviHDquocdv1X603WQp10ycI0P+MJPUXzP+9
         kWUsqtidwYyNaMhXiP0I5tzVWEyUcfVsUIbJY9L/NBUHJCYombwajJHTuu3Gulooc7c0
         LjRg==
X-Forwarded-Encrypted: i=1; AJvYcCWhAXTd/NuWQ91wvF6RQYCGmmw7GWgZBhXC2mOX9aTzT00TdDsogDx7aPLmbNv8G0CAa/8+eZN7dNeuhms3vBkmGBmbyg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz2KYdApIc+PxOQMHlF6oZLbVS3TVhRm8ySFozmd8RUXJOP/SeJ
	ymEZYv+/UWtyaJCuA/F0cVg7ermaQ1t0yZVOzpEIsuNqjesbIdzZubvYfuc36/I=
X-Google-Smtp-Source: AGHT+IFVWvpC9eUfR4kkytxJGpxpdM3zPPRNsFGV61OJ6jnfJQWTleZHnFIaa58lvkjP5q6dXeyAEw==
X-Received: by 2002:a05:622a:38d:b0:446:46c4:2410 with SMTP id d75a77b69052e-45d80495580mr121615361cf.6.1727969151728;
        Thu, 03 Oct 2024 08:25:51 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45d92e0a454sm6441431cf.30.2024.10.03.08.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 08:25:51 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:25:50 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
cc: brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com, 
    quic_jjohnson@quicinc.com, macro@orcam.me.uk, tpiepho@gmail.com, 
    linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
    skhan@linuxfoundation.org, ricardo@marliere.net, 
    linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] lib: math: Move kunit tests into tests/ subdir
In-Reply-To: <20240924032200.167622-1-luis.hernandez093@gmail.com>
Message-ID: <rr71n5p4-366r-p027-n4p4-on6or7n99p34@onlyvoer.pbz>
References: <20240924032200.167622-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Sep 2024, Luis Felipe Hernandez wrote:

> This patch is a follow-up task from a discussion stemming from point 3
> in a recent patch introducing the int_pow kunit test [1] and
> documentation regarding kunit test style and nomenclature [2].
> 
> Colocate all kunit test suites in lib/math/tests/ and
> follow recommended naming convention for files <suite>_kunit.c
> and kconfig entries CONFIG_<name>_KUNIT_TEST.
> 
> Link: https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/ [1]
> Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]
> 
> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

About mul_u64_u64_div_u64_kunit.c: please adjust the path to the file 
mentioned in a comment which still refer to the original location/name.


Nicolas
