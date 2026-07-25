Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09B33508E
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 25 Jul 2026 04:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784952936; cv=pass; b=muALvM/QUoM9uyCjHGN7u9DDFr0iY+PmAuZT5Ze73hlRDhMp2wv21fBOU3uxpChdrMINdZamYw1FMOPptWw46+m6t1dS0FsT4WPISKHGffuxXx7eTwsYzlgHCwf7JMIQn3z9vxkTquIQcgzeEbVuy/XkZk4EsETC90qrQprVcfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784952936; c=relaxed/simple;
	bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIylKqQFcUhw/IGzH90KkPqJlB92PyDY3yRCkfE+rCsI4o1ujlkUPRFg3LGzopEkG67BLyEFCJom2CecLBz8PFAJ2PlfhQmqD40atlxL8Z2qiAGqEnHJHmek5TUkQqOqegSZsFVg9XcyImEjo2f2AURks53LXnAUJQS49WcFEM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0hXWobH; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0hXWobH"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7ee4f241f42so1183161a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784952923; cv=none;
        d=google.com; s=arc-20260327;
        b=h8PZ5h1Zki6S8qu18ARolRORs6KRYjmi+Mm//qnXpt+rhDRioN/pNQmgU9TvJJ2kMB
         064HW/RSh1JqzTbzSlAEaNrvrMYr0916KMhVsoZEVkPYgsmklSdUNu+kaV2kA07XUbVK
         IMA0UW4YWMMDjq+4DMHRBjlmL9H6ZLE+J9F3W94vzsFhmGMWr3ZuZrlbx+cRgckA4owK
         Nf8opNPv4hWcihOiEN9x9SUXRJoppSwkpRQyIueQ0GBzVy3n52Ud7oklUzo6QxFT9htk
         mK+HfQcJDRfnoQ6UiOxLEmmQ05O4w+YGBSmfx0B7oKbs0bp17kFgDQ2Ffnh0ANE1jROu
         Kg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        fh=elr+dfUawKEGANGozEoRaCY5VQTTYq1no4L14eW7EDM=;
        b=IAyPYVKVTWXzjmgdSqg1frZ/PUbyBNrIjN/komuXv++q66YHHuy3caDaAC4FakFk8n
         ASHt/mHPJf+eoNc27qd5pT4KPzFMKk/4HwoDZLcDhvUweCoeL+CN6IIQU8BwsXX3CNZ3
         UDiXiSqI+Uh++W3wPVQjeS/hh+fpvGAr+j7XAa8RK+piCw68jM7zk0cfThnk4Txeb8Ep
         jQSfMrF3zFCmWxt65Y9dcSv6BycS7r88uPa97K4Gb52yOOj23/oCBbwOqk/QRMoCqIq8
         jIRULpI198eItDAPNCw2dmnqaDN7GBRrZEQKBiiq9D0cttmFWB+W31haoDqlfj/s2LPV
         xdwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784952923; x=1785557723; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        b=I0hXWobHGLE3NZOJ1aPcrGRpj0DTSIrgYtFeZKHCANgtJpPCVK/KZKinaZK2PYHmOH
         4yQ4NK1OPGdhkYvJ8Wmn6057ibRw6KjE3yciT5KNzjPTRbr8/ElZkIgh2J+HQtbZJmoM
         o6mk6p0NRJdOq6jzlG9/BvvAdbJmAg4XAYqLCrlAbyryN7RkgG/ERyU+iC9oaOc2EE7+
         K+cCTVX4d4rn7HqL3KGu0Jw6nn2tBfCfUbm5Dp6qlovqiIIVhD32h7eQ5wjCirdyrkXb
         EE0sedynyPTyV6FEQgu82GE+AV8BjjSTfIb57r2sOTjLJmaDXQ09IWLzXmu1j/TUeoeY
         fZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784952923; x=1785557723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PzCFk4xbsY3MKeojRX/yYHw+xRC2LcniEsfPHyAmr2w=;
        b=nvn9UxoJDlsFzkXvJEqPsIhd1nHZXtGmxDJi9AMRaAW3NebXPFBVZT/YwqwEeQ5fG0
         9XIpGwU23zZsy6EkPQOiL6mrc5qa7id65ameLtlubSim3Kt5eEWJXgOnOGX656qIy1W+
         Gnd/7zjnKXe1a5hSJJ8AT42r2qbqk465y3sVPXiiT30KRc2v5nOLqH9VYlIesyNBJJRf
         VRT0WxFuIWu+8gSjcxi2IxXlZGroLx8BH20CsN4LRKQr/MCR4y1c9tou2YmekvE+yAwv
         GWAE3INmcZgaJx7EDdfLVWqKhyuKfLO/kkaLKZj9cKqTDwkgyTL1oMXgfA5Yv2TDpJvO
         Wayg==
X-Forwarded-Encrypted: i=1; AHgh+RoRvdMujG/I56s5a5nvUMW1mi/8Angt9xQAC7k3u688KXwVj6hB+KeSQLiXhMX/Dn7/3jpHMhEyy8HY9tW8yy+HhUcaog==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKxrCvPehhTRDxiRNfBa2X4E48xvKQFgTo0Nv47OQogPAF4VZr
	zf30G0odxFtbqEyLUSgZ6U7WsfnrHTIw6mNIU+7arcH0O6KQp9sWkyXvhv8VFKxyXD4ckqbE8+y
	nH0bYmrGqSpWHVqfve+KYSQktafYYqqM=
X-Gm-Gg: AR+sD11fr6bNUG28SKhc4rHJ9Hs1VwFkp+RRh7HuyJym5NoNkDlARPW/nMLdJsXeLea
	sS0PaKSRj8SYDzW2N8eRJO5Im3s+c/BdDa9SpFqCCSM/nD1nkuy13yHqWrgjeZ+6cvZXs85Txsw
	YeQkMIvxJMloGUN5sHKPYdoxNG0n7DCqugsRByxCT0BDL9CKCFQvQbNbbB94JyQD29pwFP8Cboh
	x0ZlSTVMcbx4C0Hb+0OIbD6VvWbnWMhuS42jr3AO6w56vCN8kq1hk453eF0PnJMOQQJfoQsAAWx
	ix35BA9i2A49WY38Jb7oDVGCHGp5d5Cz8860zXwnqnAPmbBHKxDykk/9Piawog==
X-Received: by 2002:a9d:7ac7:0:b0:7e9:e288:5d45 with SMTP id
 46e09a7af769-7ee6c2012e9mr2468001a34.18.1784952923486; Fri, 24 Jul 2026
 21:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713084140.249515-1-vidhu.linux@gmail.com> <amIXogW-sKfOhuxO@daedalus>
In-Reply-To: <amIXogW-sKfOhuxO@daedalus>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Sat, 25 Jul 2026 09:45:12 +0530
X-Gm-Features: AUfX_mzFsWgUGldvlaqterMEytvI9E0k_JwQopj7dlGejEsO6Kb-qaXvx3qYaTg
Message-ID: <CAFqz8LJLZ4c3qT9LWrW8BMVknrMtiRhJzwqa7VLQuxOMkJJr=A@mail.gmail.com>
Subject: Re: [RFC PATCH] fs/ntfs3: prevent positive E_NTFS_NONRESIDENT from
 reaching writeback error handling
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: almaz.alexandrovich@paragon-software.com, ntfs3@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+57f9327d593d301ce2a2@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2026 at 7:03 PM Jori Koolstra <jkoolstra@xs4all.nl> wrote:
>
> Should attr_data_write_resident() be returning positive values on error?
> If this is correct, and this is a matter of data corruption you can use
> EFSCORRUPTED (EIO may also be fine if this is what NTFS uses in other
> places).

Yes. attr_data_write_resident() intentionally returns the positive
internal status code E_NTFS_NONRESIDENT when it detects that the DATA
attribute has become non-resident. This is an ntfs3 specific
used internally to signal the transition rather than a standard errno.

The issue is that ntfs_writepages() propagates this internal status into
the generic writeback error handling without translating it first. The
MM writeback code expects either 0 or a negative errno, so the positive
value triggers the WARN_ON_ONCE(*error > 0).

I chose -EIO because this is not filesystem metadata corruption. The
race is between is_resident() and attr_make_nonresident(), leaving the
filesystem in a valid state but causing an internal status code to
escape outside ntfs3. I think EFSCORRUPTED would imply metadata
corruption, which didnt happen here.

Thanks,
Vidhu
