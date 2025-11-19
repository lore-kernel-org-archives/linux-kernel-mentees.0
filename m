Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8102D8375
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763583401; cv=none; b=Zg1pI33rija9hf6p+XQXe7Ae/6eHYR3pGMuYGJ6mJOgRrkLrSLvgheuPABc/sx1Jk/RAhSCUGnBkD7e3ugdir6V9b/wPe6k04WgMuk116aoNKy+NFVK6n2UlvqIo4NauQfISYFZZKt8SX+X9nPLG7z3Vj+Q/4bQnVVQ2ajz2z6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763583401; c=relaxed/simple;
	bh=QksrpYaGBMg4ks34+bzn2p6qiF4oQKkk6zREhcjQhko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFZq/CufTAzzgPIYkShnpvLHn7KwNdw7xyU060JAQdMgMcovLU8lWV7CVC1MsNGOIHcRJWr+Yod5LVXeTyHHQmnGCMIYNfux7TQ/HCg5+ER1bEKgjgnchZsTWSa1vtFmizRSo5iXiA02EyrSC2F00XURvQXv5DYOf4UjtKCUwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=Rkz/J1ym; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="Rkz/J1ym"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so104657b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 12:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1763583398; x=1764188198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp4JZo+dI0J2859+KK1IS1522ME6raCu/+5sU4TezG0=;
        b=Rkz/J1ymf/f75QgYIZf5Zr7rPD1nyG+2d1cuUkXzXYNmTBD2M+yLGN5OUd0TLijPZt
         shadJ2D0hd1u2XwVjyBQieIsV6pB87OJfD+9k8vCSYapX3PKtb0Lq+CapEQ+QWRMe0BU
         Ujkud7SdFulqw75CbyK+uYlRaBYl9q4BvdGZwYOVUrBvgctobfJJFXaWwEvwybJzAdpk
         5aHxqyWfoNqI2HAcYj4UudWYkmSFIw2kPT7+h4wgVwcSzWz2dR3sO5ukCf0NHQd5fj0t
         5soPWj4fL/A/agEOQREyp8mpGuaxsLEcxQ4o4qvVepTkaSXenItzug/URL3GP24qnteo
         tqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763583398; x=1764188198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp4JZo+dI0J2859+KK1IS1522ME6raCu/+5sU4TezG0=;
        b=d8GYqbGh9OEduWlOsCpgCIaHO/McYedm4HjOodefKiRwcFTdpzJ/CMAbcH7eunsbAv
         Z1TX2nUhSUhz4kX4IuUlAzT/i6RPPLmxjLaq/pOJ0nyzJOk4qEmQ+B4WRPPBreuxszKS
         drjveq+CVgdOTGusOepGyJAj8Bvg3y5i0710Pz4pbh0OCTYBni1+bajni1GCSbBVkIyh
         VwpbIrnR9NWJovVfau5Y98wh5FhDB/5qX88jSsaWuv3fcSfaIDh2VngKLfnEM8LVuPZw
         +jkFb7KlE/iB9rj9uy4KFNrUBGRv9Af+WJCEv15vMxeK2kMupQV6StjmazMB/0Ekvfhr
         hqug==
X-Forwarded-Encrypted: i=1; AJvYcCVJc7E4QFGlfZV4pBMw4PFmaaG7oCsSxJtTcXh8gbjxUznHAksrEz7Xh+aTFU/v9krN8NqZl4twZqsy7xP8DmitS3qyPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPFv9Fsdhzl/9HttRXdwdcS1gPK3ELa5C7z/B2626Liz0j0zR4
	oxkbPWf7H+n1pIScczpjp6ovj4MTjyBjo2ijBmX6AzHgDYbowqglyAH2SLsaG5/BE3czGTpmKa8
	RgZYp
X-Gm-Gg: ASbGncvGJU5l98RQxFP7fUiWh/a8T2/iwUepsCK+xpLZ8GRBFmmhuQJexeOn0w58VrK
	8M2Tq3JqlkwYmh1Wj5OUmV1IjunYPbo5bUoXexFXiXFEPiS7GxWgNuMPh4WbhyO54ORDEW46aqP
	0Q5RXXAXkJWDa4ktXiUawGiN+EEbF1xg6wS8vdgE7plQ8DlCy40s859nPUT7bdmS3v9E+1bnDCP
	UJQQ3x7mmCsqZeqNmB4lGs4WHlASld96LvCMI0ZK6+agbGX4l0WxeBFAi5YG5UYcVwa0YGrLYV7
	Q6vMZl5Zod0f1/Rx47hJfQPOpETWe2IlJgqkfNNpJLzUjR9MaRdk9pSoPERUSXAT28NLJp3AL14
	WDmK5jRjDytsVWVuM0FNXbbivzffCfWKLq7yWb4AK3YbgH1AOsyapv47IZ0/PFrr/mPke8/zXSY
	jAXg+kuISYnV5FRJ02/fobu9fVII6dIHW2N9lsC/1fyjDz4VNf4zSFGfIKDvs5pIfsvaN0Ztm3
X-Google-Smtp-Source: AGHT+IFRtwMeHsixmDe3avA54rlITFhQkV+XJJmI491YLjAVrD0oJZeKgatd8Xpel4RieEeNlnyHZA==
X-Received: by 2002:a05:6a20:9187:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-3613b518491mr821160637.18.1763583397551;
        Wed, 19 Nov 2025 12:16:37 -0800 (PST)
Received: from dread.disaster.area (pa49-181-58-136.pa.nsw.optusnet.com.au. [49.181.58.136])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076eb3sm232098b3a.1.2025.11.19.12.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:16:37 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1vLobS-0000000D2N1-1UMB;
	Thu, 20 Nov 2025 07:16:34 +1100
Date: Thu, 20 Nov 2025 07:16:34 +1100
From: Dave Chinner <david@fromorbit.com>
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: cem@kernel.org, chandanbabu@kernel.org, djwong@kernel.org,
	bfoster@redhat.com, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Subject: Re: [PATCH v4] xfs: validate log record version against superblock
 log version
Message-ID: <aR4lorusQ0L3uT2V@dread.disaster.area>
References: <aRzU0yjBfQ3CjWpp@dread.disaster.area>
 <20251119153721.2765700-2-rpthibeault@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119153721.2765700-2-rpthibeault@gmail.com>

On Wed, Nov 19, 2025 at 10:37:22AM -0500, Raphael Pinsonneault-Thibeault wrote:
> Syzbot creates a fuzzed record where xfs_has_logv2() but the
> xlog_rec_header h_version != XLOG_VERSION_2. This causes a
> KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
> xlog_recover_process() -> xlog_cksum().
> 
> Fix by adding a check to xlog_valid_rec_header() to abort journal
> recovery if the xlog_rec_header h_version does not match the super
> block log version.
> 
> A file system with a version 2 log will only ever set
> XLOG_VERSION_2 in its headers (and v1 will only ever set V_1), so if
> there is any mismatch, either the journal or the superblock has been
> corrupted and therefore we abort processing with a -EFSCORRUPTED error
> immediately.
> 
> Also, refactor the structure of the validity checks for better
> readability. At the default error level (LOW), XFS_IS_CORRUPT() emits
> the condition that failed, the file and line number it is
> located at, then dumps the stack. This gives us everything we need
> to know about the failure if we do a single validity check per
> XFS_IS_CORRUPT().
> 
> Reported-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9f6d080dece587cfdd4c
> Tested-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
> Fixes: 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
> ---
> changelog
> v1 -> v2: 
> - reject the mount for h_size > XLOG_HEADER_CYCLE_SIZE && !XLOG_VERSION_2
> v2 -> v3: 
> - abort journal recovery if the xlog_rec_header h_version does not 
> match the super block log version
> v3 -> v4: 
> - refactor for readability
> 
>  fs/xfs/xfs_log_recover.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)

Looks good to me now.

Reviewed-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com
