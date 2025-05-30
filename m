Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279B220F56
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 30 May 2025 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644565; cv=none; b=ON3hXhYb5HK2QWj+e4C1FTTR+KykE27wlOUaoB4yEPAIUq5ptt1Tz4w5GaCGws4dUptvQg3VOVzaB9YfL5NiMd9GZhWQ08jr0psReOz7VwtpSPOmF1cn7eTW6tat2MNeO69mV/y7KXg79CcTfxJebI/fsrFPlLgfaI/kz4ccNPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644565; c=relaxed/simple;
	bh=9iRrBbKhBcH104PdZNqqsZXGDeAsEnfcOvJpHS8KBng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFkkrIUiSfwITEc1w2CRR+wjTkhn1CUOG6P+6pTEkyJsjLAZJlZ3xLHh03o7idd9I0KlwxR3DsrMUuodY7mOTshDMuc1sXyP7O6Qb3pEyTJlzGThT1Fw7iHyVbDsshlkiWob4wePfXsa7GYxJX611s78gZ0v/9KkNQWcJb9ZAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzFK3zvM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzFK3zvM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3124f18c214so874727a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 30 May 2025 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748644563; x=1749249363; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Au/WNJA8WqsNFHZ7XLmxt17fic0juTEPdSvf0qBYcM4=;
        b=ZzFK3zvMQ+Or/xsIG+KnaZDBRfIgWq+Yh01cjDz+n0QDO2bzPY/ktIm67ZOQJlGSq1
         5UlzZWjtvQmOb/+8bhsesJg7HdJBPvtl5UhXz3PIfuyHOGi8gJz6ILIWFEsm/4eRL5fM
         UAmpdK3jMPrzsqZ/08WDJHdoGaP87XxS8yenGGWQKojuGe9V2f7qmlHmNfyNF+/uB4IW
         rUdMa1+NH3pbcyJKrm0yyu1lgQkOH1FF8tCSOU/PZG74uYoa0mg+m+n7pDR8FCMa+zIz
         9a3IT2bflZcZnK7lkzFClPkjwfHj6ANlYJoY93KWTq/aEwa988Xn7067EbA0ILtPyYIT
         QZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644563; x=1749249363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au/WNJA8WqsNFHZ7XLmxt17fic0juTEPdSvf0qBYcM4=;
        b=dUBxVkWoqt20du3DuGqEPrV2dQlnz91fagJ3T0+GggevSjt6QvEq3JjeKQ4YTQikDG
         Gv8sokUYusUgA2lZSdiesONZhvm9l39F57n+iKQmAEHbN62oebkpYi4iw2NKBrnpmNg5
         vRCK0wd+AyGKmejVT++GAaK52PwasDE/K2w/Q1N4opaFtmNWr+hkwpeia9aIFFcDWGQf
         vEbysUe/8ZBw7ibs+R3GoRUrT1CNa1W0BM/4H7UUqgPI2lXoo/NSSE9HP9n1ivAt1H0e
         GRYVSOWf74/KHHLOlGFCv1hCxEAQWf3HvKklOxK8YfrOc6nqJ8DeyDQ1pXPSFl5bdMlb
         wLyA==
X-Forwarded-Encrypted: i=1; AJvYcCVmZTm8QMVvUY+5GUS2Q/KeNJ8id7+B3HyWgC7G/SojBLHxCZgxo6rzKfj5EoNRVG16sX/VWiuSpGakGBdXM/s624KSug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgOg30W91xilMe56ERpf6egXrTfCPbTUy0RoGJTEHz67fZeixS
	taFFiV8GWebkKjVtnuMFYTdx4ylsweOG1i6YoG8ANbR7Nwg7MqqjAckO
X-Gm-Gg: ASbGncstVlUO4/UGpKn5Q/jluQCZucYqioq5gRtgtHSwfuUmzoFr4xRJLU4Z921l3FD
	cx30WF2gkevVpjTzHTR8JZIvhQUEi/bGceov0Chk6QewgrWG1XlssqWXbFKisoGPDOTtocey7bG
	qGWhSnjIU64SNSTKSX6bHhoM28hJ4HKMXtDLe+VQXQi80jPBUUUChc+Yegsrya/DeuVPxS7/YEJ
	FMfkBKPn3x1zOesTVukZ+Wop0MXss7wnW1HL9pYfYtwYPP3i+qhjRPoJqR6ReaUID5IRsqpjV+C
	5N1MC2PVejaEA4ErDLMZYpTC6a5H91UbchEtFIA+O1AZkfBjZgKj
X-Google-Smtp-Source: AGHT+IEidlXG4wBqg4jen6ReNQ7Ewx8jMVQ+HaFeguKmpH1BzLDw3dNtYT4QqPsDuy+S7/U1sC1Ong==
X-Received: by 2002:a17:90b:2e4b:b0:312:1c83:58e9 with SMTP id 98e67ed59e1d1-3127c6a02bemr161026a91.5.1748644562759;
        Fri, 30 May 2025 15:36:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:24e0:5639:ebc6:8c16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2f9820sm1699452a91.22.2025.05.30.15.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:36:02 -0700 (PDT)
Date: Fri, 30 May 2025 15:35:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, bagasdotme@gmail.com, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 0/4] Multiple fixes to Amiga joystick documentation
Message-ID: <w3tcbri2zs5hbctlzrm6oulbjgubitzbv4obr7np3rwmxgrqe5@jriz35clhnre>
References: <20250526135957.180254-1-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-1-contact@gvernon.com>

On Mon, May 26, 2025 at 02:59:48PM +0100, George Anthony Vernon wrote:
> Hi, this patch series covers a few fixes & heading imps to the Amiga
> joystick documentation.
> 
> I've kept the section adornments changes amid ongoing discussion about
> it.

Applied the lot, thank you.

-- 
Dmitry
