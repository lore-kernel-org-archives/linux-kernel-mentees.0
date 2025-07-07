Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4827B51A
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874758; cv=none; b=cAXwedkNAFuO5ihCj/IXja5SWkq52haraVAuoxk+taBFwP5NP/mZD9n6awORJiJXu2wU8fiRAbRlWyTXHICd6oE7USPUFgBSIaMQavHTbjsuaPb2y0nu8ItK2IFUDzyY73UoU0bMMi3ULKfrc1VtqUWJTx5nJkGqQuyA/adgNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874758; c=relaxed/simple;
	bh=GHD7u8MLy6W9x0ZQVMwgkXAbSYr4OeXpNJoaDqFzbxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWoCnG7KG5GE1/P48Nff/t3Ojf0lUPIFiss5OEe/id7OwKX71rb2pXW0QlzA1swDvtRIUkB948au23CKh7iwgz5TppR6nXM5te2mro1HTAy0no1uENocRoDquINgRe2U0rDVn+gHV8Pt8DSNWyeHn5nqgT5JLJG0fQ+TS43XLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3sA551I; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3sA551I"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c3d06de3so3208663b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751874756; x=1752479556; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qc9/Jm3EhOg6r3cSjvfW7JqJ4HY8qkLQsGPxe+uMLd4=;
        b=e3sA551INy3ia5Ll5GvqumZst2rYe1GGuROwbPMemQhL0o54rFx/t+vmO38bEtJK87
         c0e6A82TO/GYygIqwRgElK0aIPPMxwFxHWI7oCuLImpomwnZRp64InhamOnaXHbqb/aT
         XP543I8G8qpu1F+Z3Yz0BeAzjYH6K9TuOw9DQ2MlmDjEcC51FMkvdhhXA9NzaKKc9Bq9
         DWevsX2l6BEfjbk389W4YeNUfNVjtHak4x11ZlItwoEjtali3fX/cGRgLY0SvkDS2Jr1
         EB4d6qcE5VfadMWPY+bCcEy6oUxUd1VsKTNHB2xavbucZhgJHNnYY0Xr7xzS/V+YacnC
         iVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874756; x=1752479556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc9/Jm3EhOg6r3cSjvfW7JqJ4HY8qkLQsGPxe+uMLd4=;
        b=nTBtQ/MLmH+7kJJnGV947CfpSd5mEoST+0wjnp8y/OFTLfmD8UVhjCDyrj2nXZ2tpt
         YndW9qsBWS2TGdt5DHQJkqvP5s8iJuXF3HlyybJy6JMlr2Etx/dlnEzzh0sHwKxJ50ah
         zuG9EprkliAA0MJz2sajit5CgZcVwuirwzXNuJ/gpeJJ3UkLqvov2DqguKP5gw0m0boP
         IqOV+Lpeq/hI3Pqaqsu3AmAzwALZRL3P5dczejLVPzyS+yaYLieXmNA1qSFsbLW41ei9
         zBun2ke6B+oV2osUArDXrw1CccUi3oEb/w2/+JDW3cdEPfgJfC1HMvQDgSy4wIIgAhM0
         oLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYk0RwoSUEqU4z7C6xYHHZjYJCWWpO2FUZ4sTIOvR+UbTJoMm/tJQ5IaRMpBBUfkYRc/9szDTlAQN4M2Tff0SiWQm38g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ+Q9Jzf9YyQA4QrW+CfhXJZvUGMe9hqHAFwoGzFPT64u2/mqG
	TEOexpe2i18RiGqwyY7H6KmU+qLaa3huYR38J9T4oi8r44nZhMAGFKIb
X-Gm-Gg: ASbGncsS3ctynZmpExZeDgEZagLUTBM2EzrDGckZHF8sHVLOKxIV6bxUciGb5nPs6NI
	FUTQN8I+eGtNvYm7Vu6z6T/P8Zs4B7Iee8pDiq+1aDHiPnqVw6Ztz3JQRJQMNOqH2fK4RNzMhNX
	wxq7CxdIh9S9Fp47xTmQhq84DFXRy+4tiyMcFGibg7pQtKX33+3bw+MSXb1/djLzUzygWKdO1h4
	poHXRY41hL7vl13tJe4zICGOrj/nJ1tANixk70LdgsyEe9b7EgAA7JQjKQJiPxAw04QO+ijq7F9
	yk9QZN6FKEvkXf+L2itQ9r8CheIxyqAoo+16CBJTurZUVJ39OTJpmF+OEOaWLAqAntl9
X-Google-Smtp-Source: AGHT+IEirJCByeAXvTvV0Yhd1R7ncfdagNA5N2NijJvg5PjE98/jpFGSFyXappMWaYcr8iCBMWXpVA==
X-Received: by 2002:a05:6a00:218b:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-74ce658a5d9mr20099941b3a.3.1751874756120;
        Mon, 07 Jul 2025 00:52:36 -0700 (PDT)
Received: from gmail.com ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cbee8sm7884537b3a.40.2025.07.07.00.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:52:35 -0700 (PDT)
Date: Mon, 7 Jul 2025 16:52:31 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
Message-ID: <aGt8v7RyBocLDBfY@gmail.com>
References: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
 <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98d87171-741a-4f50-a632-e84dd24c6933@suse.com>

On Tue, Jul 01, 2025 at 09:32:31AM +0200, Jürgen Groß wrote:
> On 24.06.25 09:04, Ryan Chung wrote:
> > This change uses sysfs_emit() API usage for sysfs 'show'
> > functions as recommended from Documentation/filesystems/sysfs.rst.
> > 
> > No functional change intended.
> > Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen

Thank you. I will send the v3 shortly.




