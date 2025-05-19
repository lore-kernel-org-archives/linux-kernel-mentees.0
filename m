Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C881DC997
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685034; cv=none; b=WQ5bw8HgKKSg3MbP89CU6forn1RuHG58dmBZdVHbqb6IVzeDqPKoWuehyLq5JdeYuMCdas0WbhQsDZde/3ng8emQd9gcAQUZvxhCgaisITu8ZSbC8X3fCcLul9O2pKXkiak/1312rASabwvsry1ZN8NWXtZSUQCNDgN56qdeFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685034; c=relaxed/simple;
	bh=EqLwxJVbgW2ecK92/FYG4YVeOgBfW1zvuSftBl8Ttxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzoB5ef/QjkJnrjARHvvSfQOECVCQAD72sQSuAlutSXmC5NnyhOr2fIPkq/uPWkS1tbcXbcjQmXi1pu+bJFB3BXQnAjuJ39EYSXAtM1gAObzd+8u6cmFDquXsqfq4d/sKOjaqTyyUFc8823AdYqg2zD4q7vUWsMwf15s4z6GuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m5jVMiGs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m5jVMiGs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33677183so41411645ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 May 2025 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747685031; x=1748289831; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbwzvSnj/Pe5rfAqdyUm19jDsv5CwuOGOQ67ehueUkQ=;
        b=m5jVMiGsIEbnpLmNutUyVsxZQydfFf6aWPcds+QRIUVSzvRY0ooB+TwZhQmN/rwvje
         RVNsf19tHeeb/g/2nGvQJ3L/Zm0CDNtzYl6+fTdnfk7tfWuaTN5+34qFMdBXMJ/VdGVk
         w6YZGS7NZlEwdoU1EX6m1yjju2NPCdQ+JwoyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685031; x=1748289831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbwzvSnj/Pe5rfAqdyUm19jDsv5CwuOGOQ67ehueUkQ=;
        b=HiCS1qZp9chEUPIjP9qDQVlXDhMPpCK6GJBtxgSiG/tpR3Gn93go02WYi5J0FOMWjP
         E5ZYH5NOylM/8aV15nnC0AUP8XT1iWiHigvcFzDiowerzCJpmg3DbTZrUaml6sVWF+5B
         XDWn49OXz1TAgIBX4RqA0zxlHJn3LE2FAebrkVxPoxbYvB/7G6d0kCNBLQP5aBZKAX8j
         wrz/kZIMlMDRhh4YzocKdXJQD0oGehp0c4zcLz5UtkOeVB67C9jcDvnOyCdEJ0R76Gz1
         SDCEMMIRyjOlLineB30hMYySORzQ9Azj190DgIRs49AlxKBAoCm1IaCDDhcp6Q7HfW/1
         S3yA==
X-Forwarded-Encrypted: i=1; AJvYcCVz+jjdCxCcKB3GLVoUFOm/jIywyX4l0mI2aeYEVgWxwFPpswFR4N//i8Wx/VGdABj1J61AuXfuWz7emxjDhOCpycjoMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOZ+XrhbDx7J/AFZZiynziwsfD/9qksNmPo2SAcfSx/hOdC/0I
	JYPEF2bvh0D7fWLm0ThmFSG/a8IY6KjExXlT5yCFKBTGhKlPX9Yo8C9c5hk/DM0uhA==
X-Gm-Gg: ASbGncvOMbMFFeqYAyOmqOLI0BW0V5iLPORH7EabNMvBz9RquwOE1/cGFGlGdOg3S9L
	akfxzs4JuTC5AvDwtnrK3v5XC7frfowEifOCEZYI0lCETrT49qdfV9PeGKDw54yC8J54DiNbYnz
	eVbFc8LwgXLl5tHxIB7HDw2xo0mSgkczp16gt5P8sSRg03lyH3zP271aQmNL8lTUuANvNtT5zMh
	qibGOpQGTNIXl7XKEx3Wp9WB9Cq1mY6G5Fcd/kn5gO3+oUbChXm3K8q+hJdoQE3tBptVCoN9Qvb
	uuCWfvMHU5z0sOI80CR3JYIo+G4Gy+ESqoM1Tng7RCYjUrP5c/xXJp2Ix+OpMmpq2tTchgQ9k7b
	13rk7IG+fL4C2Q9Oqd7ztxVHh
X-Google-Smtp-Source: AGHT+IErS9e6RSBXT2pW/pk4zdNSHk5nSRHMvO7tTzp6d6cj7O03GKefBpQUhfUVuc954nlDtpmekw==
X-Received: by 2002:a17:903:2301:b0:231:d160:adec with SMTP id d9443c01a7336-231de351d48mr192316705ad.11.1747685031132;
        Mon, 19 May 2025 13:03:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:379b:e49d:8d8d:4983])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231ecd5ea41sm55316945ad.228.2025.05.19.13.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 13:03:50 -0700 (PDT)
Date: Mon, 19 May 2025 13:03:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: heiko@sntech.de, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
Message-ID: <aCuOpFdTQK3cqeP3@google.com>
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>

(CC a few more)

Hi Jihed,

On Sat, May 17, 2025 at 04:05:52AM +0200, Jihed Chaibi wrote:
> A small typo in the rockchip,rk3399 YAML document ;
> "less then" should become: "less than"
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

The content is fine:

Acked-by: Brian Norris <briannorris@chromium.org>

(Feel free to include that line in your patch for v2 submission,
assuming you don't make massive changes.)

But you might consider looking through 'git log
Documentation/devicetree/bindings/memory-controllers/' to see what kind
of commit subjects are used. You should probably title it:

  dt-bindings: memory-controllers: rk3399-dmc: ...

Or something similar.

Since you suggested you're still learning the contribution process, I'd
suggest this as a good starter:

https://docs.kernel.org/devicetree/bindings/submitting-patches.html

and also its links out to other general documentation, like:

https://docs.kernel.org/process/submitting-patches.html

Regards,
Brian
