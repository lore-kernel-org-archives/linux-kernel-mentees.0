Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D086E1C7013
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753892877; cv=none; b=rV5gk+D+hKr8XTieBDq1bqf21JGfZuMId7kuDbEZgmWzEcyeXx12qfQW5TPRNpkbrOgYbBlsYTE+uXp20VvdF7WTCGe7DVhNli875DRJG/yO2DYAfEHhXbWyJ5EjUvz02YQAjE0keJf8icITFYijDB0nXn4ctO3B7D9SxuWfVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753892877; c=relaxed/simple;
	bh=VDN1MKYrHnhKs8rJltEkmxfDO0gFuhaDH2a2kia8Czw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFvomjTdE5K8CnZUJ+67lHqad28LBRUEhV3GabK0mckbk0IuKY5/ZFL6Xt6AFH6aQl0InIHXrmX74SSsXl4TQW6CdGicVVO6agbAHAHBJfxbWVp/cxrwzJCDiVFIeYIwCvn6VCud7rCIb46oKz9FPMPCGUqSGDF7TeRLPJTebic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0ctiY4X; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0ctiY4X"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-610cbca60cdso3653383eaf.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753892875; x=1754497675; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDN1MKYrHnhKs8rJltEkmxfDO0gFuhaDH2a2kia8Czw=;
        b=P0ctiY4X4oTDeNk40Ckzt/Rv0NzvFy531I2YjjzaAlPZnlXF6Dbni2BcrOVPh6QFcB
         7FsVrWEQf/5X1jsgpTdh0OofQR4Bw6rvCahQw3GalOu/FXzZCUgG4rbudvWlJgVvl7Gj
         PuCX/ZMe30Q2+CDQj94jNIiQq/ZBrV5CT8L+nXTqRL7CNlJWTs9vEcev0+08P9IC7YkC
         d6yFLPbg26q4LEVS/jWIoeKqAaj2Y3qVrqpIuiy/XCQy/Y7c7FgdANZcrjeGTmGa7xe2
         ZkEs7T9pgAWJs4OCRBi8LwgNU7wS96Xivkeu8HLH9Px/gxZrQ1Y9Zq95cI0DDcvNOilZ
         nQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753892875; x=1754497675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDN1MKYrHnhKs8rJltEkmxfDO0gFuhaDH2a2kia8Czw=;
        b=XtJK1F6nA/gcYWa9hMPm9thq4v2Dk5uBE5a86h9uYlFE5yXsydd4lv+n7qWl9Hb6by
         qvZ0R2Ba9oupk37xGZObeFxdl4j+GJZRnJauOseRoq8mgh0l6Wps+SGW8bj4B3zFrSVJ
         +wdj7xeEk47HmZ9KJCYI6X4fcrzT/gP/FP4oYKjORiIIHjqAyJwGXp04nmYig6gBaKNB
         SZnwKuJq5CGNmDYvyoEOSdCCdy2XYvcu9Yq4Yc9NqC4Hp6xu7tMlHDGUULbZFNk7pjQI
         PhS3yQTxvy0aMU7jkCPjSLtuxuD8gvM+nq++60jtEBSaPPLA0jaaPFta/ollRGIiHFQe
         UjGw==
X-Forwarded-Encrypted: i=1; AJvYcCWIckQFnLlsuB+trFIhJLAAmflk++5qUjE2nVUt8fSABsdIdpbIsx8vAnu6Is0nrEtlm25zcqe+Mi9n55g2YB6soGtNeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcbO5ctMd4606xIWvvuADMMNHbebOBFbYo/XHEwAgTsqfDiCgo
	rNyYdBGLSJpWADGrcWPGDH7bFvhyRmZyRK6bdFns0QysgoWxhjBl0l6XC2Gj6BRY+RRuk1nerG9
	xNCiDqKLlTjXtfKZeLm1XSm7u4Nxe7UA=
X-Gm-Gg: ASbGncvXdTWD+0nmnlRJYl47UAgmNpMj9c4SHcqoYhuz7lUyco19WawomJMD7s6tFgC
	BE7BTwKGWxyLA/Ubm2mIxEWPl3xmrnR6DHAR/1hHW+1gYkVXf6w/qN/zJrEetS28qg6CEPXS1Nv
	3pSMzMgs05AepqbcLL0VQQ4p0NkpBIsBjwzZ2Mt71YSVIaobyihFlim8VTP+u9kjENC/JSCkPgF
	zEaitIa
X-Google-Smtp-Source: AGHT+IFJBBircmFlzkuiZxltpkb8UXxxVju/Ryi2aiX0HE6gttXxNEsyR82wLNIYdBYNG+mN1mHi0d2hU2BueLd1gHE=
X-Received: by 2002:a05:6820:998:b0:618:d339:1fe with SMTP id
 006d021491bc7-6195d2d2924mr2688300eaf.3.1753892874659; Wed, 30 Jul 2025
 09:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730042617.5620-1-suchitkarunakaran@gmail.com>
 <30f01900-e79f-4947-b0b4-c4ba29d18084@intel.com> <CAO9wTFhZjWsK27e28Gv2-QqMozns47EacOQfXtTdMfLjR98MTw@mail.gmail.com>
 <834f393e-8af9-4fc0-9ff4-23e7803e7eb6@intel.com>
In-Reply-To: <834f393e-8af9-4fc0-9ff4-23e7803e7eb6@intel.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Wed, 30 Jul 2025 21:57:42 +0530
X-Gm-Features: Ac12FXzlj5yWkI6eKhlg68DANwG9PzzG0U_nSEKVUez-tYk1CF6GB0jjskMMJpo
Message-ID: <CAO9wTFi6QZoZk2+TM--SeJLUsrYZXLeWkrfh1URXvRB=yWtwig@mail.gmail.com>
Subject: Re: [PATCH v3] x86/cpu/intel: Fix the constant_tsc model check for
 Pentium 4s
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, darwi@linutronix.de, 
	peterz@infradead.org, ravi.bangoria@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 21:03, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> On 7/30/2025 7:58 AM, Suchit Karunakaran wrote:
>
> > Hi Sohil. Thanks for reviewing it. Should I send a new version of the
> > patch fixing the minor issues with the reviewed by tag?
>
> Yes please, I think one more revision would be helpful and reduce manual
> steps for the maintainers. (Likely after the merge window has closed).
>
> Also, please try to trim your responses to only include the essential
> context:
> https://subspace.kernel.org/etiquette.html#trim-your-quotes-when-replying.
>
>

Alright. I will send v4 after the merge window closes. Thanks!
