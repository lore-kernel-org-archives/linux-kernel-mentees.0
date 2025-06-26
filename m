Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8992E7623
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950758; cv=none; b=qZq2t5YzAu4zJfTExEdtcpHKemG+sfvabTBsKCHgquEDEqFcA7BBcRHs01zCuOn5fo3/uuLA9Hy9xlfsb6iUTo0dnUAF2arsktUzPDzIXNaQGUPcK6Go0ChCsE6euB5qGsiLMe8qgTYUBWw3qC4ss4y7nTg6/SlKpuO0SN4yqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950758; c=relaxed/simple;
	bh=kAS/IOSk7LsBnAUgqtwuX4g9he1Zg4oVAbf4qm4DPmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEFip7XSQdBliJxBDzbmUxd65hmYzuFZsRt/B9nFHHgyxkFyNnqHputWlTNgnDi+XTjTnCGujtgBqH2hdc6+CLrMQMpzjCBnUCMPr8VHzn3+gLPL9NNHgm+pXPTN+S0EBkNcSCx54ETge3snhtZAU1nuwOQjnwEEMT6eEqo14HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct2yhX/b; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct2yhX/b"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso11437381fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750950755; x=1751555555; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAS/IOSk7LsBnAUgqtwuX4g9he1Zg4oVAbf4qm4DPmk=;
        b=ct2yhX/bW+1HCRBH8yAeYyJwL0UfVJ4VMk1oz8rWIvRNL9wwkEI2KkfmloPkyqxjOt
         POQUMOasyAfZtj9ebMSkU11IPIzi804U69fFG3QLTwKz1NPq+76XdklapaLuLzJ8F8w0
         Bbfs7o/8Ez9sZFKB2T64K9eKgPqzflOBdEj3n3qRY0b9soKtt7CuyFW8wFuCVz30po0w
         Ioy+shuf6Y+RCrwgObD77LxXdj1FaOnrffv7/+1cKstpQK2UB/9POk+YfDpykct87/cc
         Ol4f3A1EahHbi9C+c81wBR+efIbGgUX4IBSSBqP+6/6LoaqW+tD6IoribkhOQla1cWxG
         v43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950755; x=1751555555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAS/IOSk7LsBnAUgqtwuX4g9he1Zg4oVAbf4qm4DPmk=;
        b=sbk9P7CPAkUaVXeQzKjah/J7QxkWcZTR5JKdq5UOLl+dFKpLiEVwx0ddy0ZmXSv5T2
         6iruoLL71yvKekiHfgHdBItJyilwgCb/N+xINyHjuW710B4Wq9h5Jvke8pgey8DIdKwn
         0ymLrW4b7rYpy8tsh0LknPGRGCHcfcHF4keXoM2b2F1pZ+noBY8uRmwjz0Hvoufuwe1I
         1dgMJyyXJmZdnWkdORmmb0mo9S/NeG2J4pJmqhn+QT8ttxZskr/V1l0OKKQMZnYLcMBR
         qlXMbdsjhKymVfhFnSxOzKdB+qiEmH1JNQ8ne9U3aoO3fGh4LDLWSLJUsMEqbZDthSbq
         AA8w==
X-Forwarded-Encrypted: i=1; AJvYcCWkLK2n1JTqTb8J152qr+R3PaDPe5K34iI2ph0VyUcz6OdKTsaxsiF5UyTzXM3e0+2yXhxTGWvvN3TbCSWAdQdarnwwnA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/mJGRhWM4Dv2HcF/QQbsMtejnGduaSBhrlykO0CVYR2Afsbzp
	PlBFviQhD8tciUgXvxnl2xCVB164jkaqrDxkZ1Abwy4k1LasP3hnn4nR614y8XzCtyo++nVx5MB
	umq+tkP5SPjEs2mz65JlB+DJ+Naxkgoc=
X-Gm-Gg: ASbGnctcNXzsyV6HBoBp/JqJTuLhDuaGS/CKQCYc0YLj213RGjpy64LRd8e84NQROj0
	A71tNsciRFu799nS/+sruwRW47vRGIOQ1EMHEaGgTB9mcP9wUGU3kK2c6vZjwzxQZhKErtjr4xg
	Ep81BdwzzIwzbfpmqD6hWD/7vUtOVDDgNqQ47VogbjNC3Vrlxa3PlQHBgddWsNlM5qn6pYuuQOp
	IlGYw==
X-Google-Smtp-Source: AGHT+IFDKoSkD2CJiWyVaF6kz2z7E/EJqhlSUVFS6EzXhXgn9q6Iom3W+1bxFqxhEyMbXQMlarVbh+wES6zPUtiA2VQ=
X-Received: by 2002:a2e:8543:0:b0:32c:a006:2a36 with SMTP id
 38308e7fff4ca-32cc658247emr22139451fa.20.1750950754606; Thu, 26 Jun 2025
 08:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623083841.364002-1-pranav.tyagi03@gmail.com>
 <aFrBeCn-j_AB1yzv@rric.localdomain> <CAH4c4jLAfMTn6wN3wJSOQZ3mAoYC3uhswDu6c+c6v-wv8mSifQ@mail.gmail.com>
 <2025062615-footpath-plank-b84f@gregkh>
In-Reply-To: <2025062615-footpath-plank-b84f@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 20:42:22 +0530
X-Gm-Features: Ac12FXwJLCSX-KjqBQhvdKlckWb8pRkvIb6E3hyGEXP7zXlxzlU_QTkv3i_OQzM
Message-ID: <CAH4c4j+ahO6yREWAQbm3ZXykASmjyEh2dzPGE0Jhj+j71qT5vw@mail.gmail.com>
Subject: Re: [PATCH v2] cxl/memdev: automate cleanup with __free()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Robert Richter <rrichter@amd.com>, dave@stgolabs.net, jonathan.cameron@huawei.com, 
	dave.jiang@intel.com, alison.schofield@intel.com, vishal.l.verma@intel.com, 
	ira.weiny@intel.com, dan.j.williams@intel.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.li@zohomail.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:26=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 26, 2025 at 08:02:10PM +0530, Pranav Tyagi wrote:
> > Thank you for the feedback. I understand your concerns and completely
> > agree with your reasoning. Please pardon my misjudgment in sending this
> > patch. I am still a beginner with kernel development and learning to
> > better assess what makes a meaningful contribution.
>
> I suggest you start in drivers/staging/ which is specifically designed
> for beginners to get involved without having to bother other maintainers =
:)
>
> thanks,
>
> greg k-h

Hi Greg,

Thank you for the suggestion. I=E2=80=99ll start looking into
drivers/staging/ and focus my efforts there. I appreciate your
patience and guidance.

Regards
Pranav Tyagi
