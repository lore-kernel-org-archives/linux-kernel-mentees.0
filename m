Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB72EAB7F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948129; cv=none; b=MWndjZjQciAePVMklVmN6pzmaswiPIynyss90VSL3na+ckWZWrYLiGgExu2oZVHIF2sNx3B4QRHk2e5Tg5Hv5vB/rTM49uO9YW9MEqnOWo9AV1A5P0JHUYQiOZBrNAXauabpwqt/aee57prYTaxqM5x4r6MS4pKEzh/UhPj/6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948129; c=relaxed/simple;
	bh=cO0dIqHpbTc6DvsuyXubTVueJiquRK7Muf6WQvl1NBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5sApm5+V+M5gHyJCUi4iXWU8DxgZ4ppQ22rO8TfrqZ5Yv4rgB1e71R/nv9Vr9kAo+axYfueBo/ko1iF8VOCEnE9Y/7Fh7xWDHxchaUZtVc/+wV1VkpiF2RWTBst2FRxsbNzW+I9hZLHC5p63kWN3KbQXRiYsDpiBEROkgaV0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui+ylMPO; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui+ylMPO"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b910593edso9054091fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948126; x=1751552926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO0dIqHpbTc6DvsuyXubTVueJiquRK7Muf6WQvl1NBM=;
        b=Ui+ylMPO5g3zDL19iOhmQBZcLY//BVlBi+GPT0wIWlDgx6RphONJVzXMAhrYNg8kGG
         0mv7PrR6tXwzCNfhyTxMEmZIZ9guuf++UvVc/jRzj93i1uwyK8rHrQIAZVegIE/29HaQ
         H9+bK0ULEshE/QNcZ1u7RXcKQTPSnqZNsDat4+Flia5sOkGX12uefHQUuD6IwtBZmvwz
         JEUSsMGJbNT3ogGLf7LhS3iwFRDDNmbFT+c4YoDykr4OU/ZqADWSJvBK3QNpbKlE484Z
         BXql5Dz0BC9abEmScGgNcsphRr7ybHqMHylBXYpnu6o0TqryvKbqBLWetiW42EwtWVWX
         a0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948126; x=1751552926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO0dIqHpbTc6DvsuyXubTVueJiquRK7Muf6WQvl1NBM=;
        b=R2lE76wEbyldVmuoT2bzmtOaNptbVYJpPHRwRgjHgxsFYItqjsP1cHj7sK8qga5O2S
         H/a40l6OsOBjkVWiSNr2A2+t53jwya047xlx8JwF2X3TRqSasYmOlxq8kdViw46Fel7b
         Ve5MpwqeJRKqTnB/jynwLwMprNXc9BjUSLsNEs2GvXExpIgKx5/cLI1gNQ9++7maFhyR
         HYQdDXbrs0Q6q53UDlbihb7QScVmU9VYEVtYO+RseSFgbd2CL9cVDUalx11tOAHYKPQs
         hnj+BIPKAmGE7A9stMtzVrv0C6UjRkqnCutbWnNmFu85GiGiqTWuocPF3fbqsQ/wUY4X
         IvPw==
X-Forwarded-Encrypted: i=1; AJvYcCW3yDUqhTOpfdiYTVUN3Sv7wSADMux9bkv+TISBIieLfYtHhoWPp8HyTHLv86jlRxYKVkLaaj5m6UcAqRBaRhChECpM2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/z3oRwrFkSQDOT1YP9K5X2908lSFJiqyvkbFl4+ko5K7/V6fM
	oxRXcz/wBZAJL5p0m0EtHj0LzOe8CKqwQSQyITkhaZbmHq4MNx4M1PQRGafYzbS0JsDWRubn8C1
	RjtM7+ni+CLwDy0/8g6YOi+YSrcLALyY8W31wmgE=
X-Gm-Gg: ASbGncsZIQwlnkzalBcdlsmV3cLDhoZ5AOfC/iQI5/8DAJndhGp3vUuXmmIsX72eDmo
	IZQ3KXux8S6MWhzuz6UcCgk+8KRgkyQERDijTYL8nUAo/dySOII6Qrx3O1JpudDc4q4dEK9XBJC
	hSi35PozMkd9iWYtrgyqKILdN14Vx1tDfXONXCfRM6KintZi84l1H5Wz0T+ZA1khGGTw+pVHAXv
	RIjgA==
X-Google-Smtp-Source: AGHT+IHwWc9v0nriRWmfxkaR6ErrKPjoGINPW/jmv4lNFaYYTGCtUBrIKjRtDfii7JIle46/WTToulmBo+DV+GFcw9o=
X-Received: by 2002:a05:6512:1256:b0:553:349c:6465 with SMTP id
 2adb3069b0e04-5550b4da73fmr6523e87.33.1750948125353; Thu, 26 Jun 2025
 07:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623091929.366357-1-pranav.tyagi03@gmail.com> <685adc4d1487b_1608bd1009b@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <685adc4d1487b_1608bd1009b@dwillia2-xfh.jf.intel.com.notmuch>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 26 Jun 2025 19:58:33 +0530
X-Gm-Features: Ac12FXwMes5vqgDVPQbqpvCV1-G1XfDIGUvHwA0zRSSmnY8QkXO5IKPoZKr4VsM
Message-ID: <CAH4c4jLH2XoqfVOx-7JxTw-fX8Xbc2zhGmCh31e4v2gQc7xMoA@mail.gmail.com>
Subject: Re: [PATCH] cxl/port: automate cleanup with __free()
To: Dan Williams <dan.j.williams@intel.com>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com, 
	alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com, 
	ming.li@zohomail.com, rrichter@amd.com, jeff.johnson@oss.qualcomm.com, 
	peterz@infradead.org, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 10:42=E2=80=AFPM Dan Williams <dan.j.williams@intel=
.com> wrote:
>
> Pranav Tyagi wrote:
> > Use the scope based resource management (defined in linux/cleanup.h) to
> > automate the lifetime control of struct cxl_endpoint_decoder. This
> > eliminates the explicit kfree() call and makes the code more robust and
> > maintainable in presence of early returns.
>
> I do not want to review small standalone conversions of individual
> functions for no other reason than vague claims of improvement. The
> reasons to convert an existing function to cleanup.h helpers are:
>
> 1/ to fix an actual bug
>
> 2/ in the course of refactoring the code for other reasons
>
> 3/ to eliminate goto trickiness and bulk
>
> This patch does not make the code "more robust and maintainable", it is
> just churn given how easy it is to verify that the kfree() is correctly
> paired.
>
> One quick way to identify code churn is when the diffstat does not
> result in a net reduction in code lines:
>
> This patch is "3 insertions(+), 3 deletions(-)" =3D=3D "churn".

Thank you for the feedback. I understand your concerns and completely
agree with your reasoning. Please pardon my misjudgment in sending this
patch. I am still a beginner with kernel development and learning to
better assess what makes a meaningful contribution.

Regards
Pranav Tyagi
