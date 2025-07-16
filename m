Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DC926528B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677287; cv=none; b=UX/bKnItrxENu9KwUaOZJDRMKpNsXxECJa8uG5DDq6R57KOYMuF/8PXhGdr7/d0kZQ/5sfpHfVQeY8M009brpX3Dow7VvNWLH8/J9r7WfLsb3E6ueAYu8CNrj8EW3FEHzz2quxAUKaKwx8cW1bipEUvNwwtqy/6tJ/mLH7eZGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677287; c=relaxed/simple;
	bh=buYIbE8b+yBnGJkQj4nap90I/0M3cyLAegERBn4DtZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbBVoUccYxQxmiZ3Ar8d7zUjZk/VIEC7hVPL6eGuvjftc1IejAhpoipHhyvlE+YSfFuoYBRGLAvXiM4dghSg0hI/+CkUHTGHBzP878t1UF4QD+BrLFyi3iKmUf+WFwIPPLJcGivfbs757eIJyTF8xmx7x9p1TY5XbrVdEvfGGmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ispSD2IP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ispSD2IP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234c5b57557so68401915ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752677285; x=1753282085; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLKg2EVNsiY8pEWCCtBrcomCdD+iwAcVZcaj3AoOsps=;
        b=ispSD2IPwt1MOnTNOSi0pQ4/ICxm2FrN6AZUoi0rBpNcDfJrAAvk1/QgkeCuXKKZyI
         SUtsIdfvCgwiHczx7wYrFyG83n1/trNs5TQHWU+2i0t0OITSMT5rjQaK5URrttje0LOT
         gkBrTfz5TB320c8AqwVdmJhaiVpzPN2jroGHCKVmhG0hrYTOGl/pUaQdVMlmo8YkaqgP
         lNkZG9FVGfx3yE0wF7OeK4l1QgynW3q2+ffCDvRPv/2BAJs3l8Fvp9s5ZC8M/n0z4IOk
         qQjRDTDPMLoMRm+HolY6/5yJaM0XJn/yBw5+p7O2Qh61KS0/6GOWelp2LHi//Ez3yN8e
         S4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677285; x=1753282085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLKg2EVNsiY8pEWCCtBrcomCdD+iwAcVZcaj3AoOsps=;
        b=Er+UFwQT8QABHgs/ictXyToM9Hi8ni/oAHRIqO2nTwTIMsTS5P5lCzziCc9780wllo
         ZodOikTRWJGMSUB3HBF6pFeQTYWxMFKmnFUj6G9ww2ffWlxqZgk9PSGZf9W7xIBFXuqb
         iuqvEMi+51u4ingO69dM+RcPw6hWs0eBJtntuhDEVowFbWQldlKnPSlbvAY4eqDyzup+
         oD5p4lg6BHHbsexl10MFzBKaVXppCzM4lF+HfHmJYESm19eYryGQQMu939VZbBZfCptG
         iWuSahgi01BHhWVY9UYCjWjt4HRhjiCzD/mq8kodtUrrhBKZZAwBK+ANB55Piv+/irxc
         7nJw==
X-Forwarded-Encrypted: i=1; AJvYcCVBGPqsAFHqnS1XuYCWPNrk7NIF3drpirENAeWc7T412XLkXsIAPJpJ9nFV26rfBE0d1uK8kxjmmUflUqrPfY3OXf5+ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzstVRvGoDDXS9rAzOdrY9Zcg3tj+pxN/X8Gv+usVBYOJRrPgA8
	nlTbPO2wfEvLSnM3dKDK6+IDpIh/UNVu0CmEx0/SaR6rXrbuRawD2IIEdWTNjw==
X-Gm-Gg: ASbGnctuK7Uf9QjkgArqJ0AC/4w12jDPNH5N1ekVgxfIjXanV088iL1xYpADqJjxdGz
	SJ6kuvVhDy6jXqcJpemcf9DnKSs/qLxd5YVyc1fVy7M3VgvpSMZk6wy2btfrcS4c2UvqQFtR8Yj
	J/2v+geJQ0aCEjPXB9G0mNmrT5sLHV5E+mW5SYLCsApHQtsewAaKZvGvch+1ccLGSQRbvsZaC27
	Nz3Q0pEUQB/4hffkVm0p2F2AMoLt1PpMh7N9N/oj8C47yR0JJ2GxaESJEYFVIPouV4a+N3xNnVP
	BWqfcGrsPISj+/PLVR4vde8Y5VYKGpFCUJGIwiWyAF98NYZ4o8XQussqIaDZRXCtExQFthLH//Y
	RK95JjaLPtmAa0so44z754Xr4tKHGK5tEAUM=
X-Google-Smtp-Source: AGHT+IECtyEgUczaoPOLaIGNwOtcRqgorDLvQjbeRFw9z5fqGFExQtpeppviy6cQ4ZcWp0JL41yi+A==
X-Received: by 2002:a17:902:d2d0:b0:234:8f5d:e3a4 with SMTP id d9443c01a7336-23e2568542dmr50953805ad.2.1752677284798;
        Wed, 16 Jul 2025 07:48:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b17sm131023205ad.103.2025.07.16.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:48:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 07:48:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Cc: jdelvare@suse.com, linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: max31827: use sysfs_emit() in
 temp1_resolution_show()
Message-ID: <607fadd3-1c7a-4efb-8d31-8117f1ee6e50@roeck-us.net>
References: <20250712131447.326995-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712131447.326995-1-khaledelnaggarlinux@gmail.com>

On Sat, Jul 12, 2025 at 04:14:46PM +0300, Khaled Elnaggar wrote:
> Replace scnprintf() with sysfs_emit() in temp1_resolution_show(),
> as recommended in Documentation/filesystems/sysfs.rst: show() callbacks
> should use sysfs_emit() or sysfs_emit_at() to format values returned to
> userspace.
> 
> Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>

Applied.

Thanks,
Guenter
