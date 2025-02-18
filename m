Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795C22DF95
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870932; cv=none; b=Oe48bR1j6c93PSWg3tkca9FsqFkLw+vNEX7nuL0KpuEqTOdUjiND7F3kBdKLVCqEJvjpTsGhoNNCNuf2jMMC0cOpH+2Di8k7zHWgik3MLi6iTSgc2NvOFL30DusZ3nGf8womGP7F9Jv1NdkwX9ewkU0JFHoeoZXoe9kjI126M4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870932; c=relaxed/simple;
	bh=rF+DqFOfI59087a/Ev+sbb4fxL1DoZUspANuVUxya9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRJhiXX4E4MzkAx+pUjFXrTXJbJG2Jzcy9TawEW2TEmYENNu0baXVAmZ4zkSssluiegRPh7gR2N3kCOrv5++K6bz4tvIVAuB7NDi0jO76hdVrEeOV6nn5hHK766/sF4zFB9pakYVx6CI2FMGrugacg8rMiVYlQiZ7HBfjzRDKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEVW9zHZ; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEVW9zHZ"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f37207259bso1249377b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 01:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739870930; x=1740475730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sezXMcausz+IaGoxGziV5wzbaNf+UQBQEy/lkhU+JEU=;
        b=BEVW9zHZf3Ig8gMZ6KqL2xEhsJBZZL01cLVFmSqLxjKp94HCDPenkoNghaIB1M+XxF
         9HAMKFVwzhL2V+8aOdpJ5xtq0iJxO0FClxQ5UzEJgPOHl69UkyqPALkVZ+n/KcTrU0F/
         kOQV7G93uvZQNmz4D7WUGrku8Urf1bFBHtj0krJ1blgZDgcSYGDqv+cbJfMdQ0EN3yAR
         Gq2t+729g+LVYXCZr5EuAXuzFACyP+CDNDz4xbOuLp4UUSaNlBJODbzv8nD7ut/Pwmus
         O/J+RztvGfmwwdv0/+Uy+U6pRq7hTqCjz5qrMO+sp74TX+iyvr+2LzKxUnugF41Be5ov
         jhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739870930; x=1740475730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sezXMcausz+IaGoxGziV5wzbaNf+UQBQEy/lkhU+JEU=;
        b=DqFkAno6oW1+ZvaDhvmsy3jNcxGvWqvsQ9hvS9KA4FvrnYkOi5m+k8j7HWFsE07OYa
         xk3uPyIPUGRc2l4zahHLlDHbbwKBckPJeVyLaoF0ZzlKzJXnUyVLWnY7FxYVsALQVNzJ
         ZKU0dP8JKnPOQ1ad8wYrnlCCraKFZE64FAC5Qoh7AERaPV9DDUkH5IcL7wr1aeWmzuyD
         FqE9uqfIq/e8GGST2/W6zHOEW2h1FVkE5oFKF7OKTnP7KYzvvrekLxgnl/6AhMlG5MR6
         4QOvudW/dtCE1kHJmwkx2rZtT0Zq5pLKAakwNEO7kEmmF9ldgT2ZLmAAs1KsWZ46fOOU
         cASg==
X-Forwarded-Encrypted: i=1; AJvYcCWlz1HcOv2dED12Q3/uBwwXB1fAeK1Mz7/0VxYSV15GP3XU3/yDdHsYGVJCsTveVRDfCUlwcwURGbXL9nbholCqep18Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSfBXoB1bDfExOlywHI8Pxsc4ONHZjsNH2ukuJpXCzgMYni9Ko
	h1ZQVGy5QHukmXkKjZAyxBiQ2PdRbIz4JQga2y3ClCpQzx+MeHPBhksCkIMcf+s7IDFD5VmUnw8
	CNCjhNdl6psyBvXpFp/ubsV+kJqY=
X-Gm-Gg: ASbGncvp/aqlNlShwPzETL1BUNrfFbx7OXaMO1JO+2d6DwotKKwpiYw9//5nJDWU4n+
	xWngfetxNvvk4mHhf0WwfFzSx3cK/qrL8C9MgiY3LlWdy+VW7xPuiu2d1yXAqSFRy5w5d4GA=
X-Google-Smtp-Source: AGHT+IGME/AC8qe5AUB1a8euFWY1Fz/Kaovk/J9faa/18hil/HqjrzuUjLy4va4QJwZOd0rfOqeVA912FK10yH1bVmk=
X-Received: by 2002:a05:6808:1a25:b0:3f4:756:52cf with SMTP id
 5614622812f47-3f4075653f4mr2211945b6e.10.1739870930338; Tue, 18 Feb 2025
 01:28:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFgN=hVJN8jUrFif0SO5hAvayrKweLDQSsmJWrE55wnTwQ@mail.gmail.com>
 <0c5f1dcf-1bd4-4ddd-b6c0-e3ee2b3671ea@kernel.org> <20250217153708.65269745@kernel.org>
In-Reply-To: <20250217153708.65269745@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 18 Feb 2025 14:58:39 +0530
X-Gm-Features: AWEUYZmqW1VEzyPQIcuB1lxWtLUFNSdx1n2rsSB5LI_l9n1oKwFOzJ96mNvsxiU
Message-ID: <CAO9wTFgjZ+in3ypHCKGOtY=K7DBBfJy82d6gXw=4mqJG4vtOjw@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: Fix minor typos in MPTCP and
 psock_tpacket tests
To: Jakub Kicinski <kuba@kernel.org>
Cc: Matthieu Baerts <matttbe@kernel.org>, netdev@vger.kernel.org, horms@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub. I've reposted the patch. Thanks.

On Tue, 18 Feb 2025 at 05:07, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 17 Feb 2025 11:08:36 +0100 Matthieu Baerts wrote:
> > On 16/02/2025 13:25, Suchit K wrote:
> > > Fixes minor spelling errors:
> > > - `simult_flows.sh`: "al testcases" =E2=86=92 "all testcases"
> > > - `psock_tpacket.c`: "accross" =E2=86=92 "across"
> >
> > The modifications in MPTCP (and psock_tpacket) look good to me:
> >
> > Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
>
> Thanks! This patch is corrupted:
>
> Applying: selftests: net: Fix minor typos in MPTCP and psock_tpacket test=
s
> error: git diff header lacks filename information when removing 1 leading=
 pathname component (line 7)
> Patch failed at 0001 selftests: net: Fix minor typos in MPTCP and psock_t=
packet tests
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abo=
rt".
> hint: Disable this message with "git config set advice.mergeConflict fals=
e"
> Waiting for rebase to finish Mon Feb 17 03:34:36 PM PST 2025^C
>
> So repost will be needed (unless Matt wants to take it into his tree
> manually).
>
> > This patch can be applied directly in the netdev tree, but I'm not sure
> > the Netdev maintainers will accept that kind of small clean-up patch
> > alone, see:
> >
> >  https://docs.kernel.org/process/maintainer-netdev.html#clean-up-patche=
s
>
> FWIW spelling problems are explicitly called out as okay there.
> --
> pw-bot: cr
