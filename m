Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BA3002A8
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 20:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497180; cv=none; b=J+F+PW6Velio+G3fJaqZUgzyR4iIY7ydfamq9lw2fD0f6SF2lRHImvJ/Vb64UoH2GMebHu3mLm6jjfSGbqPvZ/e/XgumXd1rBbcatF4yg33NLpA+FrtK3OH0Zl3preflGAi6jTrgmBKvoHu6yZvN+uhSAYOn5rHH76STw8gR/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497180; c=relaxed/simple;
	bh=Ixijsl8O436KeNnwf/g23Dbfs3V/W+Tg0u6rruwj4Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkwoaKhuLUvtKBV+KRjamTp/JDwiS3dWD2bwSKAsUtjyTQr76JFr0mi4Hip3rpeCF0Ps4wv++MlPSXxZLhkEIghaolDU/IxMkx2rtS5qTzjF8dQbfAagFHulzELta7y+K1xMugUVhWd/nj8bVYPvvJXzMdNb5HypPxwi7lsImMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=rDFSgM1V; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="rDFSgM1V"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3436a97f092so7586337a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1763497175; x=1764101975; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzKumkvqU5hskAJwpgGJbTlaAZ3Hn/6Z9FfXQJe/xJw=;
        b=rDFSgM1VyuqJPkOzB9Z4XG6+KWxcBwCwaS35diDWpVdgtp7NRGIeMYuanPo1P4xnT3
         UhT8j6kC2/zJZPSU1UFoy3/b4vXXIKC7nVAGb8J4+GJMaWWGL05tBHMVqPMIAeoVOQVa
         3TRv6JADPtqB2nHAI2F57jKb5SHbuEvvHSHMoiGQSnmtqMToiGF5ZrHSpAIX1tcxlWX+
         1CtyDpgMznWrHK8DywyH4GUm3BD+rYl2AuclbkR2o6KUnbX+POgYfJjK233yqQNZAEbN
         J6OrQpJ/6IphR/MnJXphdJimLsB9D8sYhBmnvEU8pOnRpNzInYdn9JcUeTy0fJZc8gH2
         JLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497175; x=1764101975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzKumkvqU5hskAJwpgGJbTlaAZ3Hn/6Z9FfXQJe/xJw=;
        b=AmL7Fu0WB77XzH9EQ33RXHce+/1+aeg1rLjE2fPIqLMZiXM75A7gwq7HxOALnKUsqx
         VXMiX9kmGcXEzxGWSSa0BR7yBoC7KNWoMpwF3sFvMyZU8SK0x1AdEPeFgJKXd9t0bpmE
         iqgvRYJoLU+nG+aZNMgCnlg0QKpT0W+Tj9lmbE8vsUG54pf3QEi+CPq7xBWn6qFcA7QX
         /INBSqPjzuZTURUWAyaf/uaa+BjJPl9FtmDTvkIAeSDEixOl7J9r9EOOTaX9ijj0mBsL
         Dvhaecdj4laoFMtadvGZtBFrcTqVGMPqtpa4jzeYGVPl4SXQ4CxmD+VVyyAbDkyr+ICp
         fggQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI5qjkd7oIuO2IH/kV/8MdRB76tBo8klIb8BtqUFVh5wlGReoogJOYM3hlzoK8rbUluaQsKZAfnKIW0aI4SZi3XsQs5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw71FQ/JoS+VK714HcSGCEHtcFfP3Ooan0n85NU7fO8MEEEEAbF
	ulMS7/d3nUmoNEhMRlDvTFK2WuMY0uWQGIeHRTkvryFVBuMKYqxkZdYbuGxsnOV2wEo=
X-Gm-Gg: ASbGncuN5s0eVN803GBj0XoqiE4xttn3Hn0YyHMaeh65u3lzpywTbHbgG2oPyQfEBJU
	z6wL9QPfGdlQa4sPdMpDNCf7XEsTi9WgQMRDAhO/NKl6g2/qJ9sBdOi05Jo7TpZLvbhM0hRXVxQ
	MG1SEd0/eZHcFW+IBDpzy9jhU2YoEib4RjeL1sjLrBtnfhI7osgFYTrCslvUFF1KEJyrvJmst1U
	AE63Wm7anuXW3iEzKBN2i2QtN+3wmotWvsQVa/k8vpdrop3OC6RbOB2mOtagbU5OiHudoE+FbvE
	vYi1bwJYnV2R8yKOz05kwD7YRs/USbImYxDrEZVaCEHH9exRRqxV6TOofj7Nr+hE9esiO8Q+k8n
	quYo83uO8m2BejAE/1AuNJyiasQzeGy4wLFr7TZdA3Wvr8kaKH1Sp/QTxkbfoULdjvPkQ5uUtF1
	4jqGIsSFDCptJqlDTVLYkH64UVaLWClQ/xdngNUuD5CBVAIiBTpcw5fqQkfE25HiWhH8m+SyonL
	KV5NZfq1+w=
X-Google-Smtp-Source: AGHT+IF19nMPiRln/9HkpK78ETc3mwJCTgf8j9eJisPorvTl1oiMCTpg06Eoc682+wd37BUudqW2DA==
X-Received: by 2002:a17:90b:498c:b0:341:194:5e82 with SMTP id 98e67ed59e1d1-343fa734f5bmr19748591a91.30.1763497174421;
        Tue, 18 Nov 2025 12:19:34 -0800 (PST)
Received: from dread.disaster.area (pa49-181-58-136.pa.nsw.optusnet.com.au. [49.181.58.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b04771e6sm1277033a91.8.2025.11.18.12.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 12:19:33 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1vLSAl-0000000Cb5L-0lh5;
	Wed, 19 Nov 2025 07:19:31 +1100
Date: Wed, 19 Nov 2025 07:19:31 +1100
From: Dave Chinner <david@fromorbit.com>
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: cem@kernel.org, djwong@kernel.org, chandanbabu@kernel.org,
	bfoster@redhat.com, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] xfs: validate log record version against superblock
 log version
Message-ID: <aRzU0yjBfQ3CjWpp@dread.disaster.area>
References: <aRUIBj3ntHM1rcfo@dread.disaster.area>
 <20251113190112.2214965-2-rpthibeault@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113190112.2214965-2-rpthibeault@gmail.com>

On Thu, Nov 13, 2025 at 02:01:13PM -0500, Raphael Pinsonneault-Thibeault wrote:
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
> there is any mismatch, either the journal or the superblock as been
> corrupted and therefore we abort processing with a -EFSCORRUPTED error
> immediately.
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
> - abort journal recovery if the xlog_rec_header h_version does not match 
> the super block log version
> - heavily modify commit description
> 
>  fs/xfs/xfs_log_recover.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
> index e6ed9e09c027..b9a708673965 100644
> --- a/fs/xfs/xfs_log_recover.c
> +++ b/fs/xfs/xfs_log_recover.c
> @@ -2963,6 +2963,14 @@ xlog_valid_rec_header(
>  			__func__, be32_to_cpu(rhead->h_version));
>  		return -EFSCORRUPTED;
>  	}
> +	if (XFS_IS_CORRUPT(log->l_mp, xfs_has_logv2(log->l_mp) !=
> +			   !!(be32_to_cpu(rhead->h_version) & XLOG_VERSION_2))) {
> +		xfs_warn(log->l_mp,
> +"%s: xlog_rec_header h_version (%d) does not match sb log version (%d)",
> +			__func__, be32_to_cpu(rhead->h_version),
> +			xfs_has_logv2(log->l_mp) ? 2 : 1);
> +		return -EFSCORRUPTED;
> +	}

Looks ok, but I can't help but think the validity checks should be
better structured.

At the default error level (LOW), the XFS_IS_CORRUPT() macro emits
the logic expression that failed, the file and line number it is
located at, then dumps the stack. That gives us everything we need
to know about the failure if we do a single validity check per
XFS_IS_CORRUPT() macro like so:

	struct xfs_mount	*mp = log->l_mp;
	u32			h_version = be32_to_cpu(rhead->h_version);

	if (XFS_IS_CORRUPT(mp, !h_version))
		return -EFSCORRUPTED;
	if (XFS_IS_CORRUPT(mp, (h_version & ~XLOG_VERSION_OKBITS))
		return -EFSCORRUPTED;

	/*
	 * We have a known log version, but it also needs to match the superblock
	 * log version feature bits the header can be considered valid.
	 */
	if (xfs_has_logv2(log->l_mp)) {
		if (XFS_IS_CORRUPT(log->l_mp, !(h_version & XLOG_VERSION_2)))
			return -EFSCORRUPTED;
	} else if (XFS_IS_CORRUPT(log->l_mp, !(h_version & XLOG_VERSION_1)))
		return -EFSCORRUPTED;

This avoids the need to both repeatedly recalculate h_version and
emit log messages to indicate what error occurred. It also, IMO,
makes the code cleaner and easier to read.

This pattern is used extensively in on-disk structure verifies in
XFS verifiers, so it makes sense to me to update these on-disk
structure checks to follow that same pattern whilst we are updating
it here...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
