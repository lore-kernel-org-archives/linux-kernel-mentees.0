Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C14E4349BA
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  9 Sep 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941736; cv=pass; b=hZy4mfSYmqSivBGyk/71HvSYYAG1WbxMYebJF0vgLd9mF1bcS15OlPMuHac1w0n11gWTd/5TOQ3p29bvKHCR+3fcyz1MELtUogH17kXv/qiwSmAoP58Cm+hdnNctxaG22wAl+4oCFm8khPo0KMei2VE1i2d5R4+ArFZptYbOT5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941736; c=relaxed/simple;
	bh=1k0YZrSks/fUFsNrSrQtX4TlMWE+gPqMH2XaCVooxz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kqyJsKU/REee6dc1fMQ+89y/wverd/ugwH6U+7MEziUYBFhi3YIMylHPHIftyb2EKVP8KiSb6eenU9seJmyCfuoFkjPwW//UpwL3szWgboBNdlQR+q35VmcG1AZMIzZer6jxKa4ILjRD1F0wlCY8YCZKBvYtoTF6QlyeeME3eNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Exp+OGlX; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Exp+OGlX"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so3915998b6e.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 09 Sep 2026 01:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941734; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4w0Msyzl/ckBqxSQ2AM1SYQlqqtCKfKPLE+RLoTGAq6JxgT7rIsfxIG1b+EeMS6hU
         h7KruMIM1PI4FSAEwDLx3wjzg4yXp56FwcXAB54u1BGIdoCeiOmXJ4UMENrO6gMGVt1R
         WV396LO/XxMCJ+gxPAXLa2olTe8YKTiSPw4qDJ2dFV4Dyzx95maqJehLBXSJBi6+HPhU
         B5gbSOMOPJWTIcJNpwVJ2GAf0T0aA1Yb6/RHlfvfZ6vsra48u1IpotY3Usv/DkndWXhD
         iVa8P9U5kxjtZLSJFjWAtWytjGRxFwy24hXs3882APon3SNSqVvXNrTJUjqxzmBxcVSz
         iN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        fh=UsEPWxxaxi5QCgtMe48lf2qtnFioInd+AlumixfaXr4=;
        b=Rzi5pW+dcv+QJKfU/4s+AU7pwxABZ+7G3Wv5ZdnzNOGwp378xIA3NTnzNyor3egu+6
         LM5CWXTjFVZkXMjP2y7ZJSQmFtud0yAbWZ14KVvKTeFij+8vIKdP+/5QCVbEYvvD8tIo
         Heo7VtCJkGDOoqSurhxkoBOzpLDmit7PBOzC6zJdCj7Td4bTFwpTZQ0AHySVkZTsklnb
         CsleIPR1EKmKdWGgAHGpOXjrGCO9j5voZFjgxK0o3QDHLjLm0CO1zcPdBVTnOcpMLYLP
         yzN8KWfi3H5smIh3mEdUAldGY5PsymsO6LeBcYNkbhA9MNYddfqNQxHcqL+1VvMNufnp
         Z3rQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941734; x=1789546534; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        b=Exp+OGlX7hreM8Tyam0Po+BC1ffdGpaBHIoyHPbJBYh/CRx3HQ6CncnYgaHD8NkTDK
         ZL++eZ4GBJYQy9S88EDqIMzyQrvhFd8jZ59Tq6CjTEc/XzDikqtkI7t/fhdytc5GTm0l
         jx2BoxNJjZm+QrOYI+txGXjycmSsXE7ASibNRRK8CA77Id0ykWBUQWlM47ETXR+u6eLM
         bRrbAnB1dy3d8Mv3Q5zJ1wVudduPvTi9WfkS8rDljO2es7fZP6DWq8lQlnZOg63u109N
         aYG6podQoKk+IxrR6ImCF3lUcFKrlTR3G250RAdo/3Xx+tlFKw8JoWk8F80TCcjeEqQS
         3mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941734; x=1789546534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tZpcmK/1gS5TGkCr6ZKwLD3FmVB89gMuw83dJlLlkos=;
        b=QVoA8kM9zkPfOBt29NH34Uf08FKq01WvXg/jEMtt3QagCbJ9YIhANqNJM2P00gFQYS
         ml21Qt1RCMpC5S0/ZS1YePhOb/Na8k+Tfm92yRg649gZ6B6y4o4c1GBrzwWvQJ1BY5u/
         2ebD68Io4x78iFVkMsQh4KmE9nfIx5PVOCty/2OBaN/GbEV8LjHuzqSBLZYSgjWGvtFr
         F7Mjl5QIjQn+i/RXhFtyQd1uug6l96NSdBqzds8qwYXnitVviuCBYtbN2bkFNSyFmT2l
         j/mvXlRQaw3OfMdWu7AP+fJFx2KRrKUSxA03Kx6xYN/3dbypj5zazRkvPU4XNkkTH3y2
         bSfg==
X-Forwarded-Encrypted: i=1; AKwUvByV+KE3fzFmf8OIzUm6R2fhVUlfVQReR2dy+lnRnL3jX85+158or/C5srbaaUrSYo3jNirXUEu7mh/WvSpwKVMU4uEoiA==@lists.linux.dev
X-Gm-Message-State: AFuF++mDkTeKDahvHP5qvXhTzXp/G4qCvm7Xl1zqNJYGwqMU13wLRIWo
	GvxRLFjofb6uev+ZMPrCUu3JYz+Q3RY5FV4ZYyTIZCpEcEPpleS1SUVCg5c6p8/SAVmJVwY+EvG
	B0BCbQJJIZWYdlyhd312vspgCS1uDISM=
X-Gm-Gg: AYBFou28EMOHM6os+2DwbXLg4sRuiOLeJhQclNQcjP5cuNsbv55Jko4mBjIg84kxICh
	PrJfnvgYEl9g6sNInRRgepvXuRq+KmVBj3uod4DVbyI+5kJC4dfCbLAKVMxehqxLetGLU8MOTTp
	4/7FTONpofjt9d80+4VDFq6spMDpxcx7SI35PzrbYBpFlmD5P+7+EV0b7GjjynP+/DQM62dNcA1
	QKZmiv7xf0X9Uh0eyQ8KYYw4ldWOAXfeJsgsnmUFgJvRvh+PN+Ynj9K3IDIaHvyEf8NM+OM30QP
	8ZUmIBbH9FKYPb8xZjX76+qlltZL3kCCC9k1c86vSVtxyTc8pRg1wQ==
X-Received: by 2002:a05:6820:7082:20b0:6ba:b298:ea39 with SMTP id
 006d021491bc7-6bab298f025mr7233706eaf.69.1788941733917; Wed, 09 Sep 2026
 01:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827113241.993923-1-khurana.ridham222@gmail.com>
In-Reply-To: <20260827113241.993923-1-khurana.ridham222@gmail.com>
From: Ridham Khurana <khurana.ridham222@gmail.com>
Date: Wed, 9 Sep 2026 13:45:22 +0530
X-Gm-Features: AcwNN1Vn8yplOdaKFbDy39xEGoIKeoW4yBYnchV3TkVWT-OzB6_OizXULzOq6JU
Message-ID: <CAOu+XQ+=O4SfYw_ojpoj4kc7CYVUvMZ9hf3T3JHYpKuVqo89Ng@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Brigham Campbell <me@brighamcampbell.com>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent this patch on 2026-08-27, during the 7.3 merge window, so it may
well have got lost in the noise.

Do you have any feedback for me?  Is there anything I should change, or
would you prefer a v2 rebased on the current tree?

Thanks,
Ridham Khurana
