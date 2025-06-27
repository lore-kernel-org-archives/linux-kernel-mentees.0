Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A41C5D55
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 04:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998746; cv=none; b=iwNlqhqTVGJEH92PnIFNpB/gq5rq2lC3jPc5xblGy8ZzIoEC8H7ZRZ/6pntfEENKqoJ1A81QVSoe9Mtll6/uSkYp0xG//GmdTBI8h5sF8tXwY1ji3TcS62p0QIBy0Tjo1heL4qtlefdlcn6+4Gg0ICP04HkeGgljW+zozt+iyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998746; c=relaxed/simple;
	bh=v+42VstUVNPd2mezC8iuO8gwNNt9a6yuYkzSDlyNOJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNSNE8IN3zchuWXemB/XO4nj07nw3RxsY1HDqRjVb+CRLLc6jivIi9tWgIIn4H3+a5TILsl+8jEaCxsOeYIkeReplgqkv7y2wvU89ArGHZsmbD+4NdhTmFZ4c8C2+hkZMhiYr6z64xSATE7rero79BEAgrp7aK/scpNJnHBHAsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eqqt9vbG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eqqt9vbG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747ef5996edso1516059b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750998745; x=1751603545; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Et1vKrANEWd1oLPdiIp7rldoq/gXylaA1yJpyMaOcf8=;
        b=eqqt9vbGNKgGPHtBA8jwimu9o8LlgpJMCr42MIG8WoZZhWIXXlJYEPkZmSH8xQNeOv
         vXaWbfMnCTS0/6LdjCjiublaCT50Y9k/O1MmPPi+yT6KKHL6ETfY0ENYLyehfF8QQyHz
         EAFsfNcXWa36ukkaS3QpNgnzbwfx9REt2QPzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998745; x=1751603545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et1vKrANEWd1oLPdiIp7rldoq/gXylaA1yJpyMaOcf8=;
        b=kNSAWwWqsRbhQxKPqx8CDWchIANXGzXvASvH0WouC57sBZ0pwHoVwhm2PPUMz3xown
         h+mSvwZTShMpcOomX+QmiI8+VLshMmZAvljycXpV44vcWYY0NKBmJtDrlH55DBaPQ6EU
         nbZRcQv7CCvo47V7/nZj9qdJoE96l2VSMJvTzFs42GqjZOz4SXkqHQJ15zAZBKMgi7Jo
         pGFeUXQVbGHHeh5/VOsk/iSucWl7thGOs4V0MUD62hi3ILf3bnozN1wEQPoclwd5snPc
         hX2mPAmHOl97Dw8o/aWk8/hr4zcM8ye4qPKzLMdUzafQR0EB34D8WH67i1jv5EI7ITXA
         /UtA==
X-Forwarded-Encrypted: i=1; AJvYcCWtu0KGPfuJiwYemAav+FtS1b+Bc5SO0C1jAydz7lPZU+ecJCFELpQ6IA1sQCeh8yXIr80+JfAWPheXfK+wuukhwjFGwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvSpqmNh+z/2zC56PBS+uau47qt/zRqnnSzBwxIfeLjvnKRs/A
	T3yzHu/04sHkAJ5sv5GPmAY3ZE9xCbyVpKDL1lfJ3osA3JgI55gOi4hZdgpRBizhHQ==
X-Gm-Gg: ASbGncsrRW1UrIC40rANwvkKVBP8RFStq7QQ2PU+F/GKJU/S3Ndoy0AoHUTH6ct7OLD
	+IfOFeIt21LNAxRtRagGBWeuPeMc4gN/VNOyHMMli99KgnRGTjeCxSwtnRFPQm0a/Ah3GEx88U7
	5wzQtWbS4FQ4xfhhtg2iuoJ5JzGXiWiNiBX0qOiwYZ2QZ/6mR6jTsDay+3rqAsTCT0aUxU+xTGu
	lVzSxa/b9fAFXTaBh8MmOMaalWDrG5EF3jJToS2zDrcFRarbBYlHez89PdbiVUfKUoi0TdGdXwA
	QrQsqR5hK4W4VWCOR9cOvt/ZiWpSJIXD0UbsCYX0IHNb9uCtdwRmfy7+FzWOh1p/Zw==
X-Google-Smtp-Source: AGHT+IFsUUHvXLkVnFLLwlY36+r3+Fgx+TFevhxTOC4GjFZoOrSNFaMyU9W5wFF/BGs6YIpTwbjcOg==
X-Received: by 2002:a05:6a00:23cb:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-74af6e60f24mr2433036b3a.6.1750998744783;
        Thu, 26 Jun 2025 21:32:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:de1c:e88f:de93:cd95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b37bsm1190315b3a.24.2025.06.26.21.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:32:24 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:32:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>, Rahul Kumar <rk0006818@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-ID: <zzscki3fdg75nl4gojsqo7exhwodt6sm66avcwmmhnz5yvc5sm@sld334al6udp>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>

On (25/06/27 09:22), Rahul Kumar wrote:
> Replace scnprintf() with sysfs_emit() or sysfs_emit_at() in sysfs
> *_show() functions in zram_drv.c to follow the kernel's guidelines
> from Documentation/filesystems/sysfs.rst.
> 
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.
> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
