Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E3C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 12:12:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE2E3206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 12:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pA/X/l/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE2E3206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74C8886850;
	Mon, 21 Sep 2020 12:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rC2pwhpvDaxJ; Mon, 21 Sep 2020 12:12:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AB5E867FC;
	Mon, 21 Sep 2020 12:12:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FA51C0859;
	Mon, 21 Sep 2020 12:12:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F9E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8C14185FB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djD55XhfqLMb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:11:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A7F76854E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:11:56 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id y25so3183018oog.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=O53UfZrdFDaL5dwfAkiOMuxDSIBhJ/FiVSPxTY510/M=;
 b=pA/X/l/F6J7hiD0v/zRY3HmV0sy57X8yybdSU+SPDQZcmLViW4XhV6m5KG2ZjN+BGH
 eeKsb+pMWUDvgJe7pgTQAhcGE21EQ8me+OcXuW2apSv5f9qi3iSybuq4+HoOjJLMf7Lj
 0Ja018UwSZRwJQZ64abr/ioH2M34jTCltDsNwZgG1siuEeCtmunoBEuiMgvA87v/Mb6L
 T2OItEuOXHTWtmN2LDiz2wpbKZJK+IcsHlG6PIvL27AHVBDLSEcOJ0pqAcVSXok3BVvQ
 zDvf+pR9IGKwIGwc+Hnh3X9DeuB3TWDnF1Sr+7ElMpAMygVUlIAH3t6K60WMwv8vZLjb
 4oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=O53UfZrdFDaL5dwfAkiOMuxDSIBhJ/FiVSPxTY510/M=;
 b=Ln63zd/HfYET9lAYitzM4iVZe/uSpIGlI14gecm0mzb5GZ+mJ/+u1rcJ0Excq0sEH1
 mfFiKJvoT8SLeoLe9JbJGPnCcdNU+vH35nmIeGd4gEQvfYdHmBv0eYM0nB+fOaIiKM4r
 g2kZmYrfSFlK33/eJkz2PHGJh/pEwR5XStYrjlmWzjm/qKVimRhw/jSVUdcOptcD+YJF
 +FJ104dMt1yOaNl1cyJ2f9p7p0GzNjG2GgHz89Ee+v/wXMMbYt1lqmk/bF8c1ThL11/K
 DwdeI4BH0MrWlAJJQr0UOUHU4DuCOdIheEtejFQjN9wizX+9FwGFv5L5ViKeQ3misg23
 Ugbw==
X-Gm-Message-State: AOAM530QzhpvXiLExRUodQWNJHcb1tgVoY88jWibfPBnBWEJgeyXJA4N
 Hsakn5LkFsNM0uw45IEtVMZgf1nQbj0hIrWmcJ8=
X-Google-Smtp-Source: ABdhPJw8cKmCKUQaF7bEfQBUmi2BtQEwb3ls9AIdVcHEml3Y+FhJzl5uSm6NZcp+nbY08flqYatbY2cCPEbQOH5Htbc=
X-Received: by 2002:a4a:a385:: with SMTP id s5mr33044683ool.8.1600690315633;
 Mon, 21 Sep 2020 05:11:55 -0700 (PDT)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 21 Sep 2020 17:41:36 +0530
Message-ID: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] checkpatch.pl improvement:
 NO_AUTHOR_SIGN_OFF warnings for users with multiple emails
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

Hi Joe and Lukas and others,
I would like to elaborate a bit on the issue and the solution I
have thought of for fixing Missing Author Signed-off-by
warning for regular committers who use multiple email
addresses.

The problem:
While running checkpatch on previous commits to the kernel,
there were multiple such instances where the author had
signed off using a different email address rather than the one
which he used to mail the patch.

From Lukas's data:

$ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv  | cut -f 7 | sort  | uniq -c |
sort -nr | head -n 8
    175 Missing Signed-off-by: line by nominal patch author 'Daniel
Vetter <daniel.vetter@ffwll.ch>'
     68 Missing Signed-off-by: line by nominal patch author 'Trond
Myklebust <trondmy@gmail.com>'
     43 Missing Signed-off-by: line by nominal patch author 'Thinh
Nguyen <Thinh.Nguyen@synopsys.com>'
     40 Missing Signed-off-by: line by nominal patch author 'Pascal
van Leeuwen <pascalvanl@gmail.com>'
     36 Missing Signed-off-by: line by nominal patch author 'Alex
Maftei <amaftei@solarflare.com>'
     31 Missing Signed-off-by: line by nominal patch author 'Valdis
Kletnieks <valdis.kletnieks@vt.edu>'
     24 Missing Signed-off-by: line by nominal patch author 'Luke
Nelson <lukenels@cs.washington.edu>'

So most of them belong to the case where they have signed off
using a different mail address. I believe these can be handled
better.

Proposed Solution:
The .mailmap file contains mappings of the following types:
  name1 <mail1>
  <mail1> <mail2>
  name1 <mail1> <mail2>
  name1 <mail1> name2 <mail2>

Thus loading .mailmap data and matching email addresses for
the same author would resolve many of these warnings.

Now the remaining problem at hand is to have a data structure
by which this query can be handled easily without much extra
overhead.

One possible solution is while parsing the author, also load mailmap
and load associated email addresses to the author and load it
into a hash. Next when a signed-off-by line is encountered and
the email is found in our hash ( or maybe some other ds ), then
the signed-off-by match should be positive.

Is this feasible? I would be looking at other possibilities too. But it
would be great to have your view on it!

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
