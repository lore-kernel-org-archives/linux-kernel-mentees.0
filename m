Return-Path: <SRS0=69VX=FZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13201C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 19:47:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F4A2251E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 19:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F4A2251E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13B0886A36;
	Mon, 21 Dec 2020 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y2yl82eqzSE9; Mon, 21 Dec 2020 19:47:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFFA986A16;
	Mon, 21 Dec 2020 19:47:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1FAEC1825;
	Mon, 21 Dec 2020 19:47:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C350C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 515262079A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 19:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDLOtofcbt2m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 19:47:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by silver.osuosl.org (Postfix) with ESMTPS id 06371203C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 19:47:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id o13so26515726lfr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 11:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCaqywpip8Yn0I9wjnjl8p0JIPhtxhmhw1itEF9XD4I=;
 b=lsZBbol6rMPwR63PVS21t8lHOPLAzfuBu0WvcFhYqLE5Qn9PfsiNTZHrU9OGgM5K8f
 PD/Gkbjp2eNZq54pCl21LIPjQZirw67cMl4U1nv/Qy4BSKrRcMAqn+0s2C8hNlbKWwnj
 KZ8+yCADWew2ccyJrehfsGyDhkJxPdgvYiSFQQgFCSAS69aJY/ggXIo57GS60tmgTUrz
 TBgI6lkhD9bJbUFFrm9XLuhLtIakpkYpML8bUrlG1RswyToHKhUjaW80/fYc77d7Ckap
 59H0LSzxuxUWiBQMZdWzKKk1pGo3Oho+hPs+NVDG0H0SbFuHF2v2x/n3Yzi6yTMixzif
 9HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCaqywpip8Yn0I9wjnjl8p0JIPhtxhmhw1itEF9XD4I=;
 b=NQ+MIgzzloTXWwza3VJoYsTRoCDbiDo/HH9VO9yNTvPgxA+TayIZAvyKHy04cRbww9
 vhup1s7N51XVUFO5VGJ1Luc7nPnDDsjkQQg5gWqrzySZb1QgpGwI5Pj/O/W5KAtqOK+P
 CJZOssbjzzvjFK5hKSrG0+RJ1AW8bBIwkANorktGbJU/dHYRQxXdUUek9+PsmBpMs2uE
 r7AccsewhOPd1T9ofpoOeHy56eBxKXVdEM0WXVvMnOEuCG4XjSUqdPdI3nO745Su8lTC
 +vK3Bx6w/Be2XrC2nKF8TC/ky6gWT9U0A/Kk2jmkQup+1EQuOsbH+V+wvfOkluouQGVv
 ugtQ==
X-Gm-Message-State: AOAM533jncgSoMCukONBX9dSLt7wbKWPvNTCm6vbmNsX/a3+GMV8w32z
 tcDffFZLCYKW8ArQ66HlgWXOmE5ktjHQgWWtwJI=
X-Google-Smtp-Source: ABdhPJzZHqcKLrLrQLtmwzo+ZWDx+zAZrM4Hkg8mHgNBFe4GZC3OPZE/2x4egc6kHMojPgK5DTmu/Mo0OFUv9j3LKv8=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr8503638ljc.284.1608580044040; 
 Mon, 21 Dec 2020 11:47:24 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5C6bxhxSp3FqE7zui=gOmNGe4VX__-qPtG_1bD16hoAFA@mail.gmail.com>
 <dc09c6a2-dafd-c26e-19fb-ebd7eb212447@gmail.com>
 <CABJPP5AP-gFJEY9D70+HeHUfQC=MnRzps1dOx+Ev+pf3rxBmug@mail.gmail.com>
 <cffb4773-3396-6ebc-f556-2f5d2138b67e@gmail.com>
 <CAKXUXMyD1c1iPEOvPksq_znqbhst=xbqpW5=peyD_+asFMznaA@mail.gmail.com>
 <CABJPP5AOwoshncvbdooy1df4++5NKY-fUMVQUm8yze-w+6-Gmg@mail.gmail.com>
 <CAKXUXMz4fBJ8a_vpYow14yiKoKhC_=bQHHd4WXfOcsxJxqbdcw@mail.gmail.com>
 <660a4bb0-1ba4-acd4-e8bc-a53cccfbf10a@gmail.com>
 <CAKXUXMy7XbmWmj5HOrAJ-fYAdZmK0kd9NnP_i4cpOaS7eqCnrw@mail.gmail.com>
In-Reply-To: <CAKXUXMy7XbmWmj5HOrAJ-fYAdZmK0kd9NnP_i4cpOaS7eqCnrw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 22 Dec 2020 01:17:03 +0530
Message-ID: <CABJPP5At6mYOCDyQWLf72guKaWV1xJxyYPELk+_4WQ8E+f9jfg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] POC script to apply patches into a
	test-branch and run clang-format
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

> Okay, I downloaded and tried it:
>
> perl ./scripts/applypatch.pl --clang-format test.patch
> --branch=test-clang-format-bfq-cgroup
>
> but it failed:
>
> git checkout test-clang-format-bfq-cgroup
> Already on 'test-clang-format-bfq-cgroup'
> git am $patchtest.patch
> fatal: could not open '.patch' for reading: No such file or directory
> Clang formatted patchfile generated at:
> test.patch.EXPERIMENTAL-clang_format-fixes
> git checkout test-clang-format-bfq-cgroup
> Already on 'test-clang-format-bfq-cgroup'
>
> How about setting up a minimal travis.ci check that runs this command
> on a small git repository with one file and one patch on top for
> testing purposes?
>
> The script does not have error handling yet, so the next steps are
> just executed blindly even if the one before failed and is really
> required for the next one to do the right thing.
>
> I generally like the script, let us work a bit on tuning it for proper
> error handling, add some basic tests and then discuss it with Miguel.
>
> Lukas
>

Hello Lukas,
Sorry for being late on this update. I have my college exams going on
right now, so that caused a bit of delay.

Nevertheless I have applied some changes along with some error handling fixes.
The script is available here:
https://github.com/raydwaipayan/apply-patch

The script has the following options now:
usage: $P [options] patchfile(s)
Options:
--branch=<branch-name> => test branch name
--format => Use clang format
--clang-format-diff=<s> => clang-format-diff path
--help => show this help information
--root=<root_dir> => root dir location

By default script searches for "clang-format-diff.py" in path. If it goes
by any other name that should be supplied using
--clang-format-diff="FULL_PATH_OF_EXECUTABLE"

I ran the script like this:
$ ./scripts/applypatch.pl
0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch --format

Expected output:
git checkout -b test-master
Switched to a new branch 'test-master'
git am 0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
Patch applied successfully:
0001-scripts-mod-cleanup-a-few-checkpatch.pl-warnings.patch
Running clang-format
Diff written to clang-format-fixes.diff
git checkout master
Switched to branch 'master

Lukas, could you check if this script works on your system as expected?

Also Aditya, I think the latest clang-format-diff goes by the name
'clang-format-diff-8' on debian based systems. While in my arch based one
it goes by 'clang-format-diff.py'. Can you verify whether the script works
directly or is the executable path flag needed?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
