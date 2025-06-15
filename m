Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5B8F5E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749975180; cv=none; b=i1KHMdSdhNsuzj2I79f+Sn2Xbao2dgoFCB/jRFkytgCaLVXYnMLixIc6MCiF3lqGfHK5jLrm7j32N/3QB7hnJJ4QrDOROivUfS5LYDuqumzubvRPhpNjQEQjffrw7XwILdP5uzVYSJTT3dkB7eU35SKxVJWoVKtjlRnVmhsGsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749975180; c=relaxed/simple;
	bh=pmdzSLfzz4NJSGkzCeH65VWIRKJh/IdzZWPJQwgCcdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VclPO9zax/iOQkks7gn9HVytA2+DZjlVob/sW5pXzpx6HZzmL/21UQafft2YeCHPquEcNUdOAOBmhUqAQnsImerE0YM6QpQBg8u41Gq8VU1VXrAfe0l59QLTrEpV5YweMimmPOYP+OpEvbgvN3blwCQZrh9IXl4QDxscitIeTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1CcMsPz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1CcMsPz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313a001d781so3193343a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 15 Jun 2025 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749975178; x=1750579978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmdzSLfzz4NJSGkzCeH65VWIRKJh/IdzZWPJQwgCcdk=;
        b=J1CcMsPzDLYvorKGhNAcnoeTKYf+EFnh4m5fxWaafDfRU889DRj3gRBn/Qsh8zItT1
         BpaUiwTcQyxB8wVIRZ0RyFV/wHqFQSzZ6PXQHhj/xZdY7LHM8QLOcas3zuoIh60iR4st
         GX41gXScfZASGmjme69BXizN+j2lNFu1+kyZzuNgWCQNQLwCAGybnCTQz/nFsfdqyl5j
         5gjp4BJw8T43/jcpOFR42/W13Rkpf1+OqFZFl2GIjV4TQkYKMO4YXYyEwbTb/AuoXLVz
         0N+D6eISKeBaqBEzRPwtmNPhmOiE8tYitSqcEahyoFoe6P/Y4RecwPEljmbpy009D38r
         79ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749975178; x=1750579978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmdzSLfzz4NJSGkzCeH65VWIRKJh/IdzZWPJQwgCcdk=;
        b=HTqfwsVMQZ4YdGUiQlWJnj1Y/DeJzCxR0/cEvhIbzxGe4PMpE/J2Addwk7jD8CxrsU
         i8aEF1hXbDckHMN/b1a8HilTYQXCK7+5pt0cuzHeV6gcB/JmNqW7BelMmtGTViZwfRfo
         Xl13iX2y3AZLXgH0HZgYVpYdXRAJdGJqRv7quxrfGvFb25I5yrFMgmDPufpcVoYp6A2d
         IRuCAvmVzujjuNDbayqtYhVeIK+5l3V8jAZpJrrWKCaKiW4zwsu2QVP4HSyaa7PJCNao
         CZxqyCGWvm0L54iGzufPs2tL0LOJ2LxYbRSQz2U1ZuXDK8ZPQYcsEfUr492G6llWOU0k
         ItjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaeMuUE6uVZzQPcWlnNBZn6J1WeeIgPEpHjq2O18FwFCPxvgS81K3t7LF2MEDbvn9T/SxutOF5TAYdmCG1hBMfcN5sFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ+IrcZ+xVsxzzahN9voO/JRK59nEGMt3z/7XNUWfgjtABFJ1I
	HPexkR+v4E8vn8xMWT4Tl7pv6j10dB4Ndv34jAO9FIq4m2b82wvgFxm+5txyAXd586nWyGG+wSH
	87oMYp9TQtITYdxUNvWNO+4kfaroHN+4=
X-Gm-Gg: ASbGncsXkntQ3a3b7Ar1+z8R64c6oaCYYVrP5LDoonKqIm/VivCJ7d829Jcw47JVc+d
	ifBI27O7BIJn20bSfHYg+pL5uCsQIId9IKjd4RN3a+RA4ArTBxo1WcC4kiaziVVT7lfYDo0kIga
	UMzjRC9FRr6f7ihu333dUmudc+O+8kq9BiZ3I3yfnSXrzj
X-Google-Smtp-Source: AGHT+IEsnfJNoeGV0RBNht4K15BTOJBtctaMTJTk0KKCmh27yXWO6d7sAjMAr6HGafs/GiijObboLKEuq0WCnxjZnhg=
X-Received: by 2002:a17:90b:268a:b0:313:283e:e881 with SMTP id
 98e67ed59e1d1-313f1cc5abbmr8371614a91.11.1749975177964; Sun, 15 Jun 2025
 01:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250614185743.657564-1-bharadwaj.raju777@gmail.com> <bwga4jheevnhuwwpopfwbzsjsxvmte4mtybevkfgssem4zftjo@anj44i6sfyd4>
In-Reply-To: <bwga4jheevnhuwwpopfwbzsjsxvmte4mtybevkfgssem4zftjo@anj44i6sfyd4>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sun, 15 Jun 2025 13:42:22 +0530
X-Gm-Features: AX0GCFuFY-S2D2fUnnHdP_B9uSG3e9P4KroojRUUPxsfHHXiZ0eYnoVubBoBns4
Message-ID: <CAPZ5DTEtsqJ_z7OtRVKDqb+LkvS=UfNvCTUqnY2Pu6qGVs+PEQ@mail.gmail.com>
Subject: Re: [PATCH] bcachefs: don't return early from __btree_err for bad or
 incompatible node read errors
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 5:49=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sun, Jun 15, 2025 at 12:27:40AM +0530, Bharadwaj Raju wrote:
> > After cd3cdb1ef706 ("Single err message for btree node reads"),
> > all errors caused __btree_err to return BCH_ERR_fsck_fix no matter what
> > the actual error type was if the recovery pass was scanning for btree
> > nodes. This lead to the code continuing despite things like bad node
> > formats when they earlier would have caused a jump to fsck_err, because
> > btree_err only jumps when the return from __btree_err does not match
> > fsck_fix. Ultimately this lead to undefined behavior by attempting to
> > unpack a key based on an invalid format.
>
> Hang on, -BCH_ERR_fsck_fix should've caused us to fix fixable errors,
> not cause undefined behaviour.

-BCH_ERR_fsck_fix in btree_err (as _ret from __btree_err) prevents a jump
to fsck_err, so if that is the case, the code afterwards continues
as normal. That's where the UB in this bug comes from.

I think I should explain the path of the bug:
1. bch2_btree_node_read_done calls validate_bset, with a jump to
fsck_err if it returns an error.
2. validate_bset has btree_err_on(bch2_bkey_format_invalid(...), ...),
but in the bug case we were in btree-node-scan so __btree_err returns
fsck_fix, which means ret isn't modified and we don't jump to
fsck_err.
3. validate_bset doesn't return an error code, so
bch2_btree_node_read_done goes ahead and sets the invalid format --
and then UB happens when trying to unpack keys based on it.

> Or is the issue that we're returning -BCH_ERR_fsck_fix for non-fixable
> errors?
>
> Glancing at the code, I think the bug might not be limited to btree node
> scan; we now seem to be passing FSCK_CAN_FIX for all errors in the
> non-btree-node-scan case, and I don't think that's right for
> BCH_ERR_btree_node_read_err_must_retry cases.
>
> But I'll have to go digging through the git history to confirm that, and
> it sounds like you've already looked - does that sound like it?

Isn't the bch2_fsck_err_opt(c, FSCK_CAN_FIX, err_type) call only in
the node_read_err_fixable case?
In the must_retry case we return bad_node. But I'm not really familiar
with all this, so I think it'll be best if you do
take a look.

Thanks!
