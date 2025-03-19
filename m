Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E0AD2F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Mar 2025 02:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742352590; cv=none; b=C2dbqrebr6JCjg8387IJvjGklUCnRGja2nxmrByvkW3kE9UB0W18SW1XkQVVTDKyur8lYDpcdFY766GwIIztcTIuaqGzxz7cHVHMb1p+GYIsAuC3bJTCQwoT9JPUJ3yHp2J74BGjIwCfXoMNsa2lbLsnQzJJBIcDGotBmBXNZjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742352590; c=relaxed/simple;
	bh=pICdKZNcGC+5zvEc+vvoa3FV70H3JSDGWKbzRWJArNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwIyo7NriHnDG5rebq0502b2/q6xa/+lE32DWjT0nV9nOMCQPwiRpSd9oNda2ydHMiD94fLami4I/49RNhxtEf2Mpz7t7s/fOBguSPHPzIPwNJGbPyHbufMv45uj9I/aovIiSjhP3EB8tF103PFnRDeJ8i4uwD1mU8euPnyaxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpkR4Lw8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpkR4Lw8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-300f92661fcso6550235a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Mar 2025 19:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742352588; x=1742957388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMjmwags9PxBLRAOXxKiTlqWWUculpX9nKgMI6vXHOk=;
        b=dpkR4Lw8hd1UQpVvGZ8OB769Rf1BpP6Wy0DbjYUYBrinBkZBJdJv5Ju7a0D/Y7e0Si
         XzCza0G4ttOy6fETaW6NNrL2fW7eAivMNGYh3zVjG8c6uTGdS0BE/onfZgYzatuAFnsh
         N+QyOn/PnJ2m6GbtbNiF4r18YFi8/DY+JS/rduROfxFBiyKWV4/GzHvgUrTDedD3oeUd
         ifLDkS06zE6CisaYuyNukAtVRH1vxzjAPizFi8meDqYOdgk4CoEwJvD4COGtiupKZXVa
         3FDCeFdXiA64mW3RGkgy61a5ne3/UTvcR+79vGyGK9Aw7SsllCKQ/3uWkbdAYzsekBZV
         hOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742352588; x=1742957388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMjmwags9PxBLRAOXxKiTlqWWUculpX9nKgMI6vXHOk=;
        b=cIUHmONSIi4ga9y9UAJkz74RuRnFlMTtT3gdlBzkzIkDCsacbl4Sf51LZJfYxT2BVv
         4dpMV01HJc+heQben0EtL5zUr8cmgrw9PRMO7QBQ8RTgMDBxQn8eaeddC+OSo/YcvBil
         DTuJBkz7DzBEZRZ7kGfBRpD5WGa82og9LNl4KcVoS4tRyswphWTOqI9tZcVImc9NMRn+
         xkKBgquUY58Xxm/m02lgSZuqovm6B1JOd9fx9w4waDgvFE5mB6Js7YwmJssw21FMUcZ/
         9p8jvafFj7NGvPXTha3V1bAVFWxffwoVdEu6iLU7MeqH+CQLJOqxTPgAnHulNhfBHfdH
         iKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV86J+M+9iuT1TuPHfx6QDbc+uNGMHfV2CsioU4Go2uotYVOCuthu24skOsa5c+GREFPmu2JYvVAujs44PnDNrKPwJ1gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxblzs902azYKIeiuQP7QWIFIAopZuC/9qLEPdIVrRGL0HqcbcX
	SJwD1pl27JOyF4AW4YACConOMc37csnqZ/KCt5NFaqfP+ari2O/V
X-Gm-Gg: ASbGncs5OhOWolI9CKUQVe1wdN9jN6OtFj8QbGPUCxq1R5rLvQJPgYpHUSRRrRhbsDf
	4iigGEvy7tNL/6QKoeNqHaK96j08pktpVaLbDdxEXv52HOJxozwhfr936lzm9dO7GCtiBIyFKhP
	lKMcCfoM0KJCPTbyqsyIVU6pIUY6DTRWn2xPZyTcyLlaFUGg6tQTzP616H+rWWLj+0kK0g/sjQM
	TOU0W4oLF3mZq82NdZQmA2c1qVXSC3SHZTdA9UmjsK8glPQlHr6FEts0tmNsxobO1wPfyaxtpH7
	w4lVaEEofV2+fSdzQRA4Mud+uBKYYOIOKve9EMpbMXrbWcjHalV9GuWGoJaWOg==
X-Google-Smtp-Source: AGHT+IHxy6SOL2dLmCXKbFrDeWrRe2l6UABse2nAedGfZHGSxvdnZ3srrmvkX9UhrTbS0a5suZsN4A==
X-Received: by 2002:a17:90b:4b88:b0:2fc:ec7c:d371 with SMTP id 98e67ed59e1d1-301bde5cab0mr1403489a91.3.1742352588007;
        Tue, 18 Mar 2025 19:49:48 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:2ccc:91ef:96dd:9ad9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5cf193sm342429a91.42.2025.03.18.19.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 19:49:47 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:49:43 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: hirofumi@mail.parknet.co.jp, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] fat: Refactor fat_tolower with branchless implementation
Message-ID: <Z9owx0FbCfc8LHUa@vaxr-BM6660-BM6360>
References: <20250318034309.920866-1-richard120310@gmail.com>
 <20250318040323.GW2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318040323.GW2023217@ZenIV>

On Tue, Mar 18, 2025 at 04:03:23AM +0000, Al Viro wrote:
> On Tue, Mar 18, 2025 at 11:43:09AM +0800, I Hsin Cheng wrote:
> > Elimate the need of if-else branch within fat_tolower, replace it with a
> > branchless bitwise operation. This can reduce the number of branch ~130
> > regarding to the test script[1].
> 
> ... and for values outside of 32..126 it would give wrong results.

Ahh, sorry I didn't take these into consideration, I guess branch is
necessary here then. Thanks for your review!

Best regards,
I Hsin Cheng
