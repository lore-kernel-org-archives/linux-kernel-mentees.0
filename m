Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867932ABF3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766675899; cv=none; b=Vz7E49o19C/LMMcLT0FiZQ0386ofjyVeMV+3AVS4QgeIfNRXJ+9qGcLwr1HOw0bpoOnuu94B7g+y/E/a3T7YYY0cwT9FGHhC+Q6G7aeL87lBSUTclATFjdEGj8ePR2x79Wb1PMFK6fmx5rx59w8QAs0XxloYKutkcYAWr5jqcA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766675899; c=relaxed/simple;
	bh=MbMBUpR7B2x4JyBu84ec/Nl4m/QIwV9QVVSShfb9dMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5N7RuAwlI+EcolK6rYDXAr0akPXI8zjy1PMHnkjbdDgBSp5wqreAIay1YAXh9xsvpuuV3BGx6P8rZuZMsU2/9haO+SQqe87kRBUECM4Eg5P5mei7wVBszeIE57JoLJdM4bP5muoVBL/m8eNC1o+iRjAX95HNAk+g77lSh7XaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTIw4JEk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTIw4JEk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c2f335681so5133608a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 07:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766675897; x=1767280697; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs6BJX7+RWUbYyZjj+cOPleo4iCRlFe1YsbACYZyhFI=;
        b=bTIw4JEkcCXQ9ejgwJNYNJElCHsV40P6dQRww/I+QbefKWT9ukl/chZoLoU6OW81s2
         ZcqDh56+B5yL0uGunVidX5SaXKy/doH9wwSYONz3XwmsrBVjTxI6F/anHl+t55JH3GWT
         DU9zZt8k/vKFReeW2NqhfJ9IKRkRYEQNyUEjwCSVeD21sr36zwzIbgPJFPpSl45t1UvM
         Lnxmh2UzMEi6xHrgoPBlPugy6p4HwWh1h6FOqNKkNWLBdXwLbckmvQ3+tLwBC/tAbVKE
         FN0YBYdzChdxySkHOwugRZqieLmpfKBjWCCfanz9d2j+PlUsZkz5jx/ZWGHt0p8Y1nZ5
         x+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766675897; x=1767280697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs6BJX7+RWUbYyZjj+cOPleo4iCRlFe1YsbACYZyhFI=;
        b=WGpG7/pYR5E4zAKQD8T2IHhyrOwwI9CoFq96i+S0Jvx5HkxcCvubvhuAzWDyOWL9fo
         vsfqnaTYEHsIutxY+Mxq8Vka1OgQbV52+pXarEf8+1A+m4DdydOq3AmO9Lm7JGS6iVc4
         QB4rjEdCbtLZJ/IrkNtnAm/6Ts9P5T1SKLABOKS2iQwZaIr53BURtMM4c6xv02z8Qh4t
         dI2anLAsJpzMEN55jor8lW3M4YZuSyboSfDu3MTjvg4hd2v4RnO1/yxKY0gv8C5HPPY8
         BXjbiKdygeWnYVXMyjfp/4ym0/ja45w2KRIZW2J9YU1fJBV/f4+SdA8X3Ao4FQn3jmjQ
         KQ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsx+45oPPOslb6jCdMNh6fPNb5msC478Ui0QwkDdczkAgM8j4W0+3U2egHZi40mkOR9pHFHOU8e4R8vkFBPhIX+9+lsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXAGHepFaX0M8/cDSS6M3H8OjR0mR8KW8zbdgrah9DXT45+hxZ
	DNKNx8mP69JsZx4o0hu7qWI/ONe02f6nZtttidfYRop0nV25oYDwNP5A
X-Gm-Gg: AY/fxX5ee/zPF6YcbSuZoouPgofBvAsUZrqYvlCfFEDsg1XfCGalCqLuq3gmvY4k7Sq
	xPuZdYv3vIhQwabM2T3jS+3B5KIAP0lQ1gTBowpR0VgG8N8uYTamAhlzFFwu86AZLm8FbYl9Vkk
	Jc550p1qivTgLqW8y+4GFP+uCbyocPOA5FM+Kp/Q/6VIyJqXow4JMqMzqho9C+IV6k+q5/H339f
	Le18FyFisks1TWPLHBnYg9HOszQWyy4GsXFgfAz4cCgJJuW/EFh/g3bweRjzxVnUCrfeR97nESW
	hWeTXldL06kRL9RcJYasSfv0STOYhfku7k4/xDJVaPVn+Q4qHYrA0AczxTCq+TEkWdNr3SSS6Ny
	fyWvfEvzuG8N/KkZIEquWOMGcZgUwKmVQZdGu0JzA3thXGGFeQuiluhZ1TZ8la+ydi7B30XMwEE
	62voL6m9NDNZs=
X-Google-Smtp-Source: AGHT+IFyYhem34TIt5JkWzwnSB53xq94ui6A4MQrPDy5SuIyfwhYp7CBOvr+9/vlj+sQXcZsrKKlUw==
X-Received: by 2002:a17:90a:c888:b0:340:be44:dd0b with SMTP id 98e67ed59e1d1-34e921f582amr15972331a91.34.1766675896814;
        Thu, 25 Dec 2025 07:18:16 -0800 (PST)
Received: from inspiron ([111.125.235.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac06fsm9337558a91.11.2025.12.25.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 07:18:16 -0800 (PST)
Date: Thu, 25 Dec 2025 20:48:08 +0530
From: Prithvi <activprithvi@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, brauner@kernel.org, jack@suse.cz,
	viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] io_uring: fix filename leak in __io_openat_prep()
Message-ID: <20251225151808.lvpfdwqvcej4vxgm@inspiron>
References: <20251225072829.44646-1-activprithvi@gmail.com>
 <176667533028.68806.11770987520631890583.b4-ty@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176667533028.68806.11770987520631890583.b4-ty@kernel.dk>

On Thu, Dec 25, 2025 at 08:08:50AM -0700, Jens Axboe wrote:
> 
> On Thu, 25 Dec 2025 12:58:29 +0530, Prithvi Tambewagh wrote:
> >  __io_openat_prep() allocates a struct filename using getname(). However,
> > for the condition of the file being installed in the fixed file table as
> > well as having O_CLOEXEC flag set, the function returns early. At that
> > point, the request doesn't have REQ_F_NEED_CLEANUP flag set. Due to this,
> > the memory for the newly allocated struct filename is not cleaned up,
> > causing a memory leak.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] io_uring: fix filename leak in __io_openat_prep()
>       commit: b14fad555302a2104948feaff70503b64c80ac01
> 
> Best regards,
> -- 
> Jens Axboe
> 
> 
> 

Thank you!

Best Regards,
Prithvi
