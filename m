Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4103C3C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514549; cv=pass; b=UXQ939LpiYSGH8VJ7gLQ1xrSKH5tuS8qtERnXjVQwy6nqqe2J5b0gqCUPBt05/H4puizwI7uENP4aXBl7G3Y6oAJRshQa9hhaexnkhMOLNn9SiEdhrjykNLs2R6Sf5XvHRPgRjauRoVcBCwymfKOMoxKIJWbckCEM45nczMlWPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514549; c=relaxed/simple;
	bh=9ZixpzfRn1SBCsB0xi/EwTaDjUuInOETTvr8eiZU0dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYbEBQOxQQqvDzDafki7ODpfg0cpMDA/GyCunz6KRzNHkqZSR+lEyyzxubGQ/V2o2o2OHrktjN5744VleYZ+yhYaVCfkdYvAhP98Yh5IPY1UYwUwsHgU6Fj7t9bZ4l7L31XRfrKgLxLO7OTT00784KDC0YxPxAsqB0Lx26zxxdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRh1qXnJ; arc=pass smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRh1qXnJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEC3F40264
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umw3A47ip8ny for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2026 09:09:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22211400FE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22211400FE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LRh1qXnJ
Received: from mail-dy1-x1336.google.com (mail-dy1-x1336.google.com [IPv6:2607:f8b0:4864:20::1336])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 22211400FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:09:06 +0000 (UTC)
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so345245eec.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 02:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781514546; cv=none;
        d=google.com; s=arc-20240605;
        b=DZ4dbHnWkCiuCAIuhwy1dZ4tM9J8S/5z6nz0rLjo64aULNKtVRRw3ouMHpETyD3wBw
         C3z6DpWKG+W1KhiY3PkQ2Sz8svnKWW1NW0J3MxhcaIZKkfU6nKENV7KWZdbSKbrM9Xvr
         u3qbhukMgVOPygBZI7wxAYeLnmSolELSUJUxfBDSa73ULgjqGE0AL0OoslSloPDh39R9
         +1iZjVdau7F2XsPrwtY+Mu//IrkIfUYcLAIMpvJznaVH3JmLpOqEr+fAM6OOidFGlats
         J/+liEwoqUmjk3PSTwciSUDYfqDN2P+UFf9GnIjxYVzZA/aBx17wtCna+2O/O4YK6VZm
         ocrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        fh=SBph+f9GK2eAFLcYaGYNCbCpPWhqK6a2mn9eKMDjmP8=;
        b=Y/j6193dio2qEQ89YReHcNbFYgM7OjyXJQa76N1e0NhqFjKrbsM/9PFWwdn799dZ6l
         i/LvNtxkBt/Jw4YxIog8QXSQZ18IwtlmFN4jyiT/zSml7sL8O0kiiEWsRhj0umnbFBlA
         TsbujOuMy1mTpC/jq3KyJxZgeS8xfueo1gP7NrnkUcXrYw/W37rY8WoB96WQhgjUnzNE
         A/LOv844hutouelKxo/a421H8Dy+cJCo7cmAy2VGXiPTee7xmi8p1gkoTFiI6nogcXV5
         lKsEGv49cyfKA7WHZGSWGhZJ9ZeapsP35RAcg66ksaINEzRFiRWCE6Nm817D4z7jn9Pc
         PTJg==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514546; x=1782119346; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        b=LRh1qXnJg1JxJipGIIopEGNJRF2aa/OazEcrcLYZ/4TMd2jEsdwStqWt+iKgrTxAdp
         OGjROHfJb0d9hLXgj+pUKgzAzIVshRnjcw3TF8qEeiqw2HnTdkZv06lPsntkQlSNaB6o
         sJmbe1uqUiQ7limeikmuOAeNrpAI+g5upa+jLaBfEG0OzYc3Xi1y2976AotoO4Y+QA/l
         4wjOyvKCeVhLUZbnyJpyT0iQYOFn3eeowawZ0TgytJq1QuzPDzOHdP1P6/MnLe9Y2mRR
         /8a0FMJsE224hubR0Ti09BVjcIU6DcZhVepzEXjMstT1CdBSpbe12/gkx47kNZ3b+UiO
         Tpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514546; x=1782119346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AO44qWTQ/piQGvf4XZH5tHBUAczI/wthj8nd/wpLVPg=;
        b=rPdXO7NuEaBkz/mr2Xi/NPqmYQIJtNEG22lcgUvgZbpy1vNYXtdZpIOMUeOyupyf9h
         H66Mkw9fkcHwM2nmG2zVNGdSG4r59Yn0+W658qbTViRln1j7FsKuRb8bXYVx4NcA+HvI
         Qp31fZQ3+J/nSAtPx+rpZuCN0vnYfRO+NXIaBMxUjaFn6M2KbvMcHH8E3AbomCS+eYMp
         9m3eNVXOtGXTYsAKc2EbEN4REc6RhLbkRtCcHRt+LtT06eKXHyy6p0SjjD043MO08xP5
         miHzNtjSJS21GXksL+dypcSYvKAsD9mRIlXnm0NA4B24jUHtXSb4m4CPMXaARjeJYRDC
         tdIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P8j7KKUfYgXQIFgTKhn5mYGW4ZeUwIfMCdzQRaKFTEHBV42lTHK4gkJtL+M+yYl/5IBjJUJI4ZCxmx2S5YkKO60onMg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwuPzhIbz2Oz04ZnaFbEfzAI7N/BaUHUvpd1vcrqqa9NB3MVIxA
	93hfv6a8zt99pwQcvH4MRLfZRXpyZakqD+AbuGMdbbP2Po3AZ6AR7zjdtN4UxB86mKwB2/iaAb4
	9JD5VjPMeq0eY4IUEHrRTIK8x7Zt5644=
X-Gm-Gg: Acq92OE0Lmr4uobDn2QI6FDdppEq8cpUV2LhCTyy/u/zOtdn14S+E5VjM2te11l/wj0
	HlywHyHe6shHQRIpsFgt228TvRCrOlmJ6sw45VDDpccLGgj2NPyY34Y0yShIbxLfoYMgEAaGk4a
	SICR0xs7ynkpPaodivtScNJM7fLTATNO0L441ZRfW8//BD0VB6RD9JvsGbFXzKVclesMqt+AZ5G
	Eec5pOagtIziB5xqzUR0tM7eaFYGkBltRS4UQkWuZ5qNi7ESo3JEn0ThkMNKiKj2gKvJ7KEAGjg
	tNe5j7sTaMGZw87PqE7vJWWL5hVKmEy6HrSJjTVCh+IvYOyfCz9sdzbj7AGkpsmrTwdvakmQd3O
	KSogjPy8dPUX9JjXJM3Mcp67HO+0=
X-Received: by 2002:a05:7300:4306:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-3081ff5d099mr3585409eec.1.1781514545774; Mon, 15 Jun 2026
 02:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com> <ai-1ZsF3dzqXZcbJ@stanley.mountain>
In-Reply-To: <ai-1ZsF3dzqXZcbJ@stanley.mountain>
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Date: Mon, 15 Jun 2026 14:38:53 +0530
X-Gm-Features: AVVi8CdAgOjprRmTsrByqmDewuzbRQiKTUslyhA214F9nI_KRho8JcmBUbG2uSY
Message-ID: <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in cvm_oct_tx_shutdown
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, Dan.
Sashiko found these existing bugs in the octeon driver when it
reviewed my older patches on octeon.
I will include the required details in the next version of the patch.

On Mon, Jun 15, 2026 at 1:48=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Sun, Jun 14, 2026 at 05:17:38PM +0530, Ayush Mukkanwar wrote:
> > The TX cleanup tasklet can be scheduled by the watchdog IRQ handler
> > to execute cvm_oct_tx_do_cleanup. There can be a pending tasklet in
> > the queue which might run after the cvm_oct_remove() frees net_device
> > structures, causing a use-after-free in cvm_oct_tx_do_cleanup() as it
> > iterates cvm_oct_device[] which is an array of netdevice pointers.
> > Add tasklet_kill() after free_irq() to ensure the tasklet is no longer
> > scheduled or running before teardown proceeds.
> >
> > Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> > ---
>
> Looks good.  A couple process though.
>
> 1. It needs a Fixes tags.
>
> 2. You need to say when you are using AI.  I think you're supposed to
> say which AI tool you are using as well.
>
> 3. You need to say that the patch has not been tested.
>
> regards,
> dan carpenter
>
