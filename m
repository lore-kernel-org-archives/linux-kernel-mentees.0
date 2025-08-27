Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5502E0910
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 Aug 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756310430; cv=none; b=BsKWL9jwa76h7mVjaE0nDQFNpgl7HJykmSEqb6k1GnWFqiKOs7Bu/7TFA8EGC56DUxF0WawTRX/RHhwgCwGGiXHSNMxpiAytjq99IexIz3eAqxvO+lX9kuFTrSYcYY45VgbuKCdy5wFpW2ZcZ2fci6KCB5jcbSHIgK9LkhTwEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756310430; c=relaxed/simple;
	bh=5r476QMUTx3iKVF4BmVQx1be6z2MX0MNrxF6wHUQJHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnEt0HXu+LZg0vO6ysUyIqCRkg34fVbkF+3qePQ1yC4XNI1pLTEG3ncsuP/dkwwvGh5RsCyrdg/RWhpq2OKed8enKmIHwZMiKFcNZPD26C/q5Y9TYymbl+BSi4a4YAIsg2S77/KPiwLqrmX547Lu+Z+FgOKFRPjhPAuZ4fV/By0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjqISbpd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjqISbpd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-246fc803b90so29174085ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 Aug 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756310428; x=1756915228; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqLQY71E8I3ZKdEgscFFUwxTNKe9h7lOzan3Lxwg46k=;
        b=EjqISbpdEEW7K49WlW7UTMnX6CT/wSibenjvGkGndt0Lh2RnRqCZ5gXiVy9tdsS55g
         SyyHuP2pFlpH/8syPM/koCYF+mRAf15LIG/KtGfOZPVrbXcBmOV+CXdez/TDD2M8glq8
         LLwkkFwII1YfCWljKI86zw/DJ5P1/g9TUTC+QOX8Hy2grG9Lkk5QVz3rNXcMF7NS+Ezn
         q6jNn5dCMinktDCeu6VgNaKL32NvCZJnb0DMgfFIEHzH1R3rrsU2BmEyLGh0fzjltz73
         NHoLVRYfs3e4QnpwdVkefBw4haNd+EtQOFa1d8r3MGdfc5tZrcJRB7QfVm/qKVBh5XJy
         VXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756310428; x=1756915228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqLQY71E8I3ZKdEgscFFUwxTNKe9h7lOzan3Lxwg46k=;
        b=TLK9MbMexhQeIMnVIJtgscxfCKiIag2ZTpPgCO5ULFxP2uLIQfQTMXH7WRsLjo7diN
         BbXkXfNFGr6NWy3Kqez/uUuheGeeJ6w9vrmF/VO+o/rcw7Q8G4BztkAOAyLeE3VqPzuU
         6kwFFSHP2cKwLkHEkTzGz8/tHOiKg5s5WGmSv9vClRe9e1ZNN7tEZzIGk+66f+LXaEu6
         /vsGwZKO/rUjjrE+OPDWQsLAWEfcBEVbv3ZiZOhz3D74pmJqIRvO0N09DnghTpSPs4vR
         ToqJrP15YSXnEovtOuxW39Q6Stu1+ZdA9fR8XSr0QdKsJk7DD9+moYbHEBi0Hpzk9LYf
         UU/A==
X-Forwarded-Encrypted: i=1; AJvYcCXme/R0zIZIBm3MrVtKrLBfrHCnL+rWMV7d3HqEQeZt9U+xSnDWueBH2DgAVOl56X/NX14PaWTkVpqRg+gW4wqx7YNQCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxC1yQiFszeqfi8vhvi1hTVyyWjQUO0i9MNMk2+epTDbfrBaTlb
	2wKrOxyCtCPewbxIq1nqoshop3SRuSvncsnh0jxLWckZpSq72DxiIWeI
X-Gm-Gg: ASbGncsT2Kk0I1w3R0hNnbB2Rg1tIY27MU02jpnyohNBH2iP8zVMmORQajW/RklKYsG
	GGSE3Ed80QZAinah3VnesPDHK61j1fLx90yZexkArCCDaTIDyjLzRx2ivXkPd54uUo/ufaDxDDy
	hbyOdQ0TLiYXx8dCQLIYViBjpNj7Nw4PhytBFRY3fxTnFbLHETjlyLtGkHIbjvcvs0aKJPbvsOl
	D1REiN7a2LBJ1i33nhb46G7j+5EVClTnyWHMOIDE43AAwHJvRDC5vBv9C5D9yIGxbR6YXlxkSH/
	Pmg2wyAJDIlCoVKvt/JtQ1gijqgDVp8nxKt8+s06ufjvdcDuzPXKCqDYu8gSWAHrW3+HgswWdK2
	gTYuGERArf+IKg90eMUtm8+n1F4YZsHHNUGo=
X-Google-Smtp-Source: AGHT+IFQz/HXmGEMAbpydvcRmEbPZ5kPQiz5oyNqxBt9FDFmtWDr2HxANuX2KR6mhMGolifQMhrpDg==
X-Received: by 2002:a17:902:f78f:b0:246:d383:3951 with SMTP id d9443c01a7336-246d3833b72mr154843215ad.15.1756310427975;
        Wed, 27 Aug 2025 09:00:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248c97f2f96sm2609385ad.121.2025.08.27.09.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 09:00:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Aug 2025 09:00:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Debanil Chowdhury <kerneldev@debanilchowdhury.com>
Cc: ninad@linux.ibm.com, corbet@lwn.net, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: crps: Fix typos in crps.rst documentation
Message-ID: <aef9db31-5504-49b5-8b0f-e776c27a5b17@roeck-us.net>
References: <20250822132836.5384-1-kerneldev@debanilchowdhury.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822132836.5384-1-kerneldev@debanilchowdhury.com>

On Fri, Aug 22, 2025 at 06:55:02PM +0530, Debanil Chowdhury wrote:
> Changed a misspelling in crps.rst documentation:
> "Critial" → "Critical".
> 
> Reported-by: codespell

$ scripts/checkpatch.pl index.html
ERROR: Unrecognized email address: 'codespell'
#124:
Reported-by: codespell

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

Guenter
