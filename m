Return-Path: <SRS0=Fejl=GX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 18:51:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6DD206FA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 18:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6DD206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1250385E77;
	Wed, 20 Jan 2021 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e17b8ywXaTSs; Wed, 20 Jan 2021 18:51:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2392E85E69;
	Wed, 20 Jan 2021 18:51:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06245C08A1;
	Wed, 20 Jan 2021 18:51:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6D85C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 18:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BC61A86770
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 18:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwFKQEoPvXW0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 18:51:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0024.hostedemail.com
 [216.40.44.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 597BF866A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 18:51:13 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 3D5F78013255
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 18:43:27 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id CB1C1365F;
 Wed, 20 Jan 2021 18:43:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: lunch37_0515e5b2755c
X-Filterd-Recvd-Size: 4179
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Wed, 20 Jan 2021 18:43:23 +0000 (UTC)
Message-ID: <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
Date: Wed, 20 Jan 2021 10:43:22 -0800
In-Reply-To: <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
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

On Wed, 2021-01-20 at 18:23 +0530, Aditya wrote:
> On 20/1/21 2:51 pm, Joe Perches wrote:
> > On Wed, 2021-01-20 at 12:55 +0530, Aditya Srivastava wrote:
> > > Local symbols prefixed with '.L' do not emit symbol table entries, as
> > > they have special meaning for the assembler.
> > > 
> > > '.L' prefixed symbols can be used within a code region, but should be
> > > avoided for denoting a range of code via 'SYM_*_START/END' annotations.
> > > 
> > > Add a new check to emit a warning on finding the usage of '.L' symbols
> > > in '.S' files, if it lies within SYM_*_START/END annotation pair.
> > 
> > I believe this needs a test for $file as it won't work well on
> > patches as the SYM_*_START/END may not be in the patch context.
> > 
> Okay.
> 
> > Also, is this supposed to work for local labels like '.L<foo>:'?
> > I don't think a warning should be generated for those.
> > 
> Yes, currently it will generate warning for all symbols which start
> with .L and have non- white character symbol following it, if it is
> lying within SYM_*_START/END annotation pair.
> 
> Should I reduce the check to \.L_\S+ instead? (please note "_"
> following ".L")

Use grep first.  That would still match several existing labels.

> Pardon me, I'm not good with assembly :/

Spending time reading docs can help with that.

Mark?  Can you please comment about the below?

I believe the test should be:

	if ($realfile =~ /\.S$/ &&
	    $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
		WARN(...);
	}

so that only this code currently matches:

$ git grep -P '^\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L' -- '*.S'
arch/x86/boot/compressed/head_32.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
arch/x86/boot/compressed/head_32.S:SYM_FUNC_END(.Lrelocated)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lrelocated)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lpaging_enabled)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lpaging_enabled)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lno_longmode)
arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lno_longmode)
arch/x86/boot/pmjump.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lin_pm32)
arch/x86/boot/pmjump.S:SYM_FUNC_END(.Lin_pm32)
arch/x86/entry/entry_64.S:SYM_CODE_START_LOCAL_NOALIGN(.Lbad_gs)
arch/x86/entry/entry_64.S:SYM_CODE_END(.Lbad_gs)
arch/x86/lib/copy_user_64.S:SYM_CODE_START_LOCAL(.Lcopy_user_handle_tail)
arch/x86/lib/copy_user_64.S:SYM_CODE_END(.Lcopy_user_handle_tail)
arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_clac)
arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_clac)
arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_8_clac)
arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_8_clac)
arch/x86/lib/putuser.S:SYM_CODE_START_LOCAL(.Lbad_put_user_clac)
arch/x86/lib/putuser.S:SYM_CODE_END(.Lbad_put_user_clac)
arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_START_LOCAL(.Lwakeup_idt)
arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_END(.Lwakeup_idt)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
