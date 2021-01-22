Return-Path: <SRS0=cwSI=GZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A64C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 19:10:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54E823AC1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 19:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54E823AC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 814852E112;
	Fri, 22 Jan 2021 19:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeHwkuEHhd0G; Fri, 22 Jan 2021 19:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D4E49230E6;
	Fri, 22 Jan 2021 19:10:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7A20C08A1;
	Fri, 22 Jan 2021 19:10:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1771C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 19:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D730187398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 19:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIDrjmOaGnsW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 19:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0024.hostedemail.com
 [216.40.44.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F11E987389
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 19:10:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 62056100E7B40;
 Fri, 22 Jan 2021 19:10:13 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: slip91_5f17ab72756e
X-Filterd-Recvd-Size: 2290
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Fri, 22 Jan 2021 19:10:11 +0000 (UTC)
Message-ID: <27366417ad75e0300d4647f776ca61bb1b132507.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
Date: Fri, 22 Jan 2021 11:10:10 -0800
In-Reply-To: <98d40817-1f80-c772-eb9e-a6c3c04625b3@gmail.com>
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
 <98d40817-1f80-c772-eb9e-a6c3c04625b3@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: broonie@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 clang-built-linux@googlegroups.com, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Fri, 2021-01-22 at 18:48 +0530, Aditya wrote:
> On 21/1/21 12:13 am, Joe Perches wrote:
> > I believe the test should be:
> > 
> > 	if ($realfile =~ /\.S$/ &&
> > 	    $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
> 
> Joe, with this regex, we won't be able to match
> "jmp  .L_restore
> SYM_FUNC_END(\name)"

I think that's not an issue.

> which was replaced in this patch in the discussion:
> https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/phKe-Tb6CgAJ
> 
> Here, "jmp  .L_restore" was also replaced to fix the error.

Notice that this line was also replaced in the same patch:

 #ifdef CONFIG_PREEMPTION
-SYM_CODE_START_LOCAL_NOALIGN(.L_restore)
+SYM_CODE_START_LOCAL_NOALIGN(__thunk_restore)


> However, if this
> regex(/^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) is
> correct, maybe we don't need to check for $file as we are now checking
> for just one line.
> 
> What do you think?

The test I wrote was complete, did not use $file and emits a
warning on the use of CODE_SYM_START_LOCAL_NOALIGN(.L_restore)

I think it's sufficient.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
