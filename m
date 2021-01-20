Return-Path: <SRS0=Fejl=GX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BACC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 23:00:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F7E23441
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 23:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F7E23441
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B00602036E;
	Wed, 20 Jan 2021 23:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDkgxZ72KKbP; Wed, 20 Jan 2021 23:00:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A04AE20352;
	Wed, 20 Jan 2021 23:00:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDE4C08A1;
	Wed, 20 Jan 2021 23:00:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CFE4C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 23:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A4A22036E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 23:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djXyh9TCjIrn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 22:59:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 9120C20352
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 22:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611183597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Om7VwHKhcnxl7GarBDwRVzXmPEeOP48pbHGghTabBUQ=;
 b=AobkxXfwsfm7IHaCD9XqCu+PuMhzarKHyrGFFo3qv7WyrTuZ+yOFQMov5V11WxiRzfYPxy
 BSUsm4cPcGbwWXpCNHlyhcT4RvbH0GYzIlDkiIyo9GggDaiv/3XbdNjE5BJiMdG1mjHcim
 o380m9lrK9fY2Liv41ne8xLPibvDvDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-SHMIIL66OSu14XH1DwGo3w-1; Wed, 20 Jan 2021 17:59:53 -0500
X-MC-Unique: SHMIIL66OSu14XH1DwGo3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96227107ACE3;
 Wed, 20 Jan 2021 22:59:51 +0000 (UTC)
Received: from treble (ovpn-116-102.rdu2.redhat.com [10.10.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D5060C6D;
 Wed, 20 Jan 2021 22:59:50 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:59:48 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <20210120225948.lgbfhy5s265we6jn@treble>
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
 <CAKwvOd=HNuB8bqJvXEjvYWorika99QX=jKSfHy2hf0NOKrrc8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=HNuB8bqJvXEjvYWorika99QX=jKSfHy2hf0NOKrrc8w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Aditya <yashsri421@gmail.com>, dwaipayanray1@gmail.com,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Jan 20, 2021 at 10:57:03AM -0800, Nick Desaulniers wrote:
> > $ git grep -P '^\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L' -- '*.S'
> > arch/x86/boot/compressed/head_32.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
> > arch/x86/boot/compressed/head_32.S:SYM_FUNC_END(.Lrelocated)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lrelocated)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lpaging_enabled)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lpaging_enabled)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lno_longmode)
> > arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lno_longmode)
> > arch/x86/boot/pmjump.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lin_pm32)
> > arch/x86/boot/pmjump.S:SYM_FUNC_END(.Lin_pm32)
> > arch/x86/entry/entry_64.S:SYM_CODE_START_LOCAL_NOALIGN(.Lbad_gs)
> > arch/x86/entry/entry_64.S:SYM_CODE_END(.Lbad_gs)
> > arch/x86/lib/copy_user_64.S:SYM_CODE_START_LOCAL(.Lcopy_user_handle_tail)
> > arch/x86/lib/copy_user_64.S:SYM_CODE_END(.Lcopy_user_handle_tail)
> > arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_clac)
> > arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_clac)
> > arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_8_clac)
> > arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_8_clac)
> > arch/x86/lib/putuser.S:SYM_CODE_START_LOCAL(.Lbad_put_user_clac)
> > arch/x86/lib/putuser.S:SYM_CODE_END(.Lbad_put_user_clac)
> > arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_START_LOCAL(.Lwakeup_idt)
> > arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_END(.Lwakeup_idt)
> 
> Josh, I assume objtool does not annotate code under:
> arch/x86/boot/
> arch/x86/entry/
> arch/x86/realmode/
> ?
> 
> The rest, ie
> arch/x86/lib/
> seem potentially relevant?

Both arch/x86/entry/* and arch/x86/lib/* are read by objtool and should
probably be fixed up.

-- 
Josh

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
