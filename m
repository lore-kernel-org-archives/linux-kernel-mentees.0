Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82B41AC77D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Jun 2024 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718886617; cv=none; b=ebaDFLlosstz3/a7/FMsYSu2DXbOfZHJvydcNGoZxHOVkTMNj4zfsN0hjgeJRbjKar5KnosxUFtas9ZNZCkA/SyW39VCl0cAwhf/kh0s9s8ICQk8rGvjPZ8TbokQZy4JS4D9P67sBMo/OlE9Dnp7s88E0HOLT6atTLLE5v+8OIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718886617; c=relaxed/simple;
	bh=UpeE/DXkO/iG0fuoDqe54X/XOy1qooPFONL7bavexrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tbisz4v1uX6bBzm7xhF+2b1fgF4idT7vCofpTK46VGA0Yd+tA5/ZDW4EvWZqspIaKvpXsgPgaGF61Z8kTAVAWoeAbVSjLd09hhbrjiNssSjBu/nzVAm+LRclJB9Kq+Nm2gxqX1/QxJGFerES1ZlTslqKxI+raG27J+4CugSYul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=aXp0SCno; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="aXp0SCno"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2AD614B6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Jun 2024 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9tMgIcndPgm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Jun 2024 12:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=rbmarliere@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72DDC614AF
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=marliere.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72DDC614AF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=aXp0SCno
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 72DDC614AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Jun 2024 12:30:14 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70436ac8882so700290b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Jun 2024 05:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718886613; x=1719491413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oHMzHVKWhLHFRTFoXNvAkGLFcNNzxK81u0mLsBL7Zsw=;
        b=kCdfo1GQzWKlK9FGcu/Z1Lv5sI3VwgU61wivFS8UY5FaQb+oNJViilzq5ZbY/buNZB
         x/nOR2+c7zfKbcwfYPMybt95+HMHg0SOrPxIqlBLu0axvfbZMW3l8G0jpwpS9kb1FmBL
         pWYk7jbVAq7N6tes0wDwb+pwAu4lqiYTZV6s1WlEmG6QVNo2OoFIQensKYqDGu79/Jxs
         5BWZaezfX6LYb8ANB/SKBUIdBSIk9jcze5TXw+CgRZ2oFtouXYMGMagRPoVOSt4hPgHw
         CZrGwpJkLLu35MikZMgqc3N3yFKfVb++vwJdwJPloDzB0/t9KfKwT6qz51KfXAFOrbLK
         WYxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4QbFoerg5EtP4LNjipcGwbUkBpRIgk1kuA8oHMJpolwcXYmOA3L5QdUlZ5eSck/IhUhIQBcRW0tg3Lnp3nCAlZfoeaXVyrY8rGk5dUr9K6xcRwrbTJG8l7hP7i45D
X-Gm-Message-State: AOJu0YwY9OWud+NFzQ8lasTwuzRVVePTA6GHTy+wo7q0e8W+zjufIn6L
	0IhCvv8pAo4FHgC9a8+/SODhXmk0NrcUNsX2Ux2kIHZhxKIXk5Jn
X-Google-Smtp-Source: AGHT+IG2sObKQlJRXnm0zIOzZdnUzQkHNGXDXN4ljr7fpHYK1vVZLwAZQXoaLia921hIfW/T+oFYXA==
X-Received: by 2002:a05:6a20:3ca8:b0:1af:f8bd:1e4e with SMTP id adf61e73a8af0-1bcbb621263mr6188164637.62.1718886612218;
        Thu, 20 Jun 2024 05:30:12 -0700 (PDT)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ce93deafsm12346665ad.74.2024.06.20.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marliere.net; s=2024;
	t=1718886610; bh=UpeE/DXkO/iG0fuoDqe54X/XOy1qooPFONL7bavexrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXp0SCnogf1kctICBTqw7Z8wi6UuwmLy9v+eiQO0w9gmS8JLoACVhp0mBfR7v4iT5
	 bmEmeXw/RPFdoNoagxpXuY+dklCEBgsHq++DNTFYlEFnZEgzcTVRlP+J9TlhQ5PJ8s
	 KevqhZDdguQkINjtGu47lua2VPPVb2/EachWZQa6Dod4vUDuDb83t0nuDSRyzvV/18
	 ELp/w2Wp6wO+ewKae2r7fSouIbEJDRs1otLKuv937IRlgNR06ElV+eRW+gXkVlF+6M
	 AR1Z9s1pHpSPZcrp/jaDL8jjYfSj9rxnG2iXb7VLS35Jg3k7bQBwYucnbmS6nMNxiL
	 AxU2ybJSP1AiQ==
Date: Thu, 20 Jun 2024 09:30:01 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>

Hi Amit,

On 19 Jun 24 23:28, Amit Vadhavana wrote:
> Hi Ricardo,
> 
> I have rebuilt it again, and there are no any warnings or errors.

Thanks for checking, FWIW:

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>

BTW, I received this message plus another two empty ones. Please check
your settings. Also, make sure not to top-post [1].

Best regards,
-	Ricardo.


[1] https://en.wikipedia.org/wiki/Posting_style#Top-posting



> 
> Thanks
> Amit v
