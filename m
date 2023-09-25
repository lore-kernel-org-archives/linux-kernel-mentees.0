Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E1CCE79A1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Sep 2023 20:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F2A6133E;
	Mon, 25 Sep 2023 20:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F2A6133E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7KIR50p
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kur6ZvPMjndS; Mon, 25 Sep 2023 20:53:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C46296132A;
	Mon, 25 Sep 2023 20:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46296132A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99331C0071;
	Mon, 25 Sep 2023 20:53:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69014C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D4CF6133E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 20:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D4CF6133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OxxXdEXZJ7Um
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 20:53:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB456132A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 20:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB456132A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 72751CE1153;
 Mon, 25 Sep 2023 20:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14040C433C8;
 Mon, 25 Sep 2023 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695675212;
 bh=7hXvLQbvJIz227Ub7eXBQQ+8+Mqa/7Yw7vX+OS9wJUM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b7KIR50pB1YTnipIRcBQKkp4IAvLhUqlQofH+lGegv4snvLGNcCkP5z+R48wy8xne
 rOL1rsTs9N174A/GSq7ZGz2RLvFrSsfLcCfRATKVj1Wtnn1NtZYXFCjP55SnkfSi5H
 BNiM7+4SQCYBs+FhcXL6gmm9jWbf6/AUZSEpmeYqFAa4/rzULQxqcEpLSQWFEmpqmf
 f9SX4hqdI0bwfnW1lAY6H3zP/YW+tMVm6djtqKcv4u8htepEAHX60jz+j6xYYiSg9U
 K/n6ljgBS2DlhxNfAJtWPnLV+oGdE3fw5w4FPEirIDIHTHVbzU/5G1UFy+5wwVCgrD
 8/Zb6sMemRZcQ==
From: SeongJae Park <sj@kernel.org>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [PATCH] selftests/damon: Add executable permission to test scripts
Date: Mon, 25 Sep 2023 20:53:30 +0000
Message-Id: <20230925205330.83701-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <VI1P193MB07529234393616AE94D58C7B99FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
References: 
MIME-Version: 1.0
Cc: sj@kernel.org, damon@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Juntong,

On Tue, 26 Sep 2023 04:35:52 +0800 Juntong Deng <juntong.deng@outlook.com> wrote:

> When running the test for the damon subsystem, there are a lot of
> warnings because test scripts do not have executable permission,
> for example:
> 
> Warning: file debugfs_attrs.sh is not executable
> Warning: file debugfs_schemes.sh is not executable
> Warning: file debugfs_target_ids.sh is not executable
> ...
> 
> This patch adds executable permission to test scripts to eliminate
> these warnings.
> 
> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

> ---
>  tools/testing/selftests/damon/debugfs_attrs.sh                    | 0
>  .../testing/selftests/damon/debugfs_duplicate_context_creation.sh | 0
>  tools/testing/selftests/damon/debugfs_empty_targets.sh            | 0
>  tools/testing/selftests/damon/debugfs_huge_count_read_write.sh    | 0
>  tools/testing/selftests/damon/debugfs_rm_non_contexts.sh          | 0
>  tools/testing/selftests/damon/debugfs_schemes.sh                  | 0
>  tools/testing/selftests/damon/debugfs_target_ids.sh               | 0
>  tools/testing/selftests/damon/lru_sort.sh                         | 0
>  tools/testing/selftests/damon/reclaim.sh                          | 0
>  tools/testing/selftests/damon/sysfs.sh                            | 0
>  tools/testing/selftests/damon/sysfs_update_removed_scheme_dir.sh  | 0
>  11 files changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_attrs.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_duplicate_context_creation.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_empty_targets.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_huge_count_read_write.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_rm_non_contexts.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_schemes.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/debugfs_target_ids.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/lru_sort.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/reclaim.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/sysfs.sh
>  mode change 100644 => 100755 tools/testing/selftests/damon/sysfs_update_removed_scheme_dir.sh
> 
> diff --git a/tools/testing/selftests/damon/debugfs_attrs.sh b/tools/testing/selftests/damon/debugfs_attrs.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_duplicate_context_creation.sh b/tools/testing/selftests/damon/debugfs_duplicate_context_creation.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_empty_targets.sh b/tools/testing/selftests/damon/debugfs_empty_targets.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_huge_count_read_write.sh b/tools/testing/selftests/damon/debugfs_huge_count_read_write.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_rm_non_contexts.sh b/tools/testing/selftests/damon/debugfs_rm_non_contexts.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_schemes.sh b/tools/testing/selftests/damon/debugfs_schemes.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/debugfs_target_ids.sh b/tools/testing/selftests/damon/debugfs_target_ids.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/lru_sort.sh b/tools/testing/selftests/damon/lru_sort.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/reclaim.sh b/tools/testing/selftests/damon/reclaim.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/sysfs.sh b/tools/testing/selftests/damon/sysfs.sh
> old mode 100644
> new mode 100755
> diff --git a/tools/testing/selftests/damon/sysfs_update_removed_scheme_dir.sh b/tools/testing/selftests/damon/sysfs_update_removed_scheme_dir.sh
> old mode 100644
> new mode 100755
> -- 
> 2.39.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
