Return-Path: <SRS0=uLYh=6G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5756DC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 15:45:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E03920767
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 15:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="SOeQtnnr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E03920767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07B878842E;
	Wed, 22 Apr 2020 15:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWxqPqpO8cv9; Wed, 22 Apr 2020 15:45:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C1E988400;
	Wed, 22 Apr 2020 15:45:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32F3BC1797;
	Wed, 22 Apr 2020 15:45:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18CABC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 069D885F68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFdnXhUUjbtk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 15:45:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from condef-08.nifty.com (condef-08.nifty.com [202.248.20.73])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0A82810D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 15:45:45 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-08.nifty.com
 with ESMTP id 03MFh0lN030474
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 00:43:00 +0900
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 03MFgffg032373
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2020 00:42:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03MFgffg032373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1587570162;
 bh=QUCpK3WJm1ifLwVFUS1q0umABM4aGa5XtBHT0c2+mZI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SOeQtnnrdnb/eEUI0PFq3PB954a4LsBSyQbyKqpLffygtHqhcDuAo4i+OnV4+02Zs
 Acl5Iw0lHqh+kcXXCeTZH/SqefvmZaygvWPSScOHx2D3aIULpkwax2jHJKwa/UqpJ4
 uTFOUgog6GvdsWAWh7c3pmyXdQk/Ajcp2OLvLqfi0EuNr5GQr3aeVE/3+styyqFqnF
 9WjVwezekrG9sppgUr2F54p207mqdYk1eEyoZX2fqT47qSf6DGj+f+nZC+lVAbZtHb
 9vzLk2eYJY35Hz65QrMQmyh3MiRTkOHw+eg7qNoiFe/msC6WhJ8yZmAAaOAYDJFjpg
 vawwuHBqHSneQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id u12so2092810uau.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 08:42:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuargM6AGR3Rem25M+NDw3UKY1UQgxS8EMB114Uw5fsf258aypRl
 p/vglrWlwHF8PDFSr4Gyp4uAYkPbaPSDQLswhBM=
X-Google-Smtp-Source: APiQypJK53incbdlqtMV7txS87GEalFCanCE0tnP4L7TDOANgXMWvWbvu8aq1Ibl5jbYxROrMtBhknLCsbHyLbBk8fk=
X-Received: by 2002:a67:3293:: with SMTP id y141mr21234308vsy.54.1587570161183; 
 Wed, 22 Apr 2020 08:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200422004844.53284-1-vitor@massaru.org>
In-Reply-To: <20200422004844.53284-1-vitor@massaru.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Apr 2020 00:42:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNBqQfMS49C9z7=opXeGv8-Y2DCDDQ2JqZPvMVZ6XwZg@mail.gmail.com>
Message-ID: <CAK7LNASNBqQfMS49C9z7=opXeGv8-Y2DCDDQ2JqZPvMVZ6XwZg@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] um: ensure `make ARCH=um
	mrproper` removes arch/$(SUBARCH)/include/generated/
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

On Wed, Apr 22, 2020 at 9:48 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> In this workflow:
>
> $ make ARCH=um defconfig && make ARCH=um -j8
>   [snip]
> $ make ARCH=um mrproper
>   [snip]
> $ make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um
>   [snip]
>   CC      scripts/mod/empty.o
> In file included from ../include/linux/types.h:6,
>                  from ../include/linux/mod_devicetable.h:12,
>                  from ../scripts/mod/devicetable-offsets.c:3:
> ../include/uapi/linux/types.h:5:10: fatal error: asm/types.h: No such file or directory
>     5 | #include <asm/types.h>
>       |          ^~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [../scripts/Makefile.build:100: scripts/mod/devicetable-offsets.s] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/home/iha/sdb/opensource/lkmp/linux-kselftest.git/Makefile:1140: prepare0] Error 2
> make[1]: Leaving directory '/home/iha/sdb/opensource/lkmp/linux-kselftest.git/build_um'
> make: *** [Makefile:180: sub-make] Error 2
>
> The cause of the error was because arch/$(SUBARCH)/include/generated files
> weren't properly cleaned by `make ARCH=um mrproper`.
>
> Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
> before out-of-tree build").
> Reported-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Link: https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ


Applied to linux-kbuild/fixes.
Thanks.



> ---
> v2:
>  * Explains what this PATCH does and the importance as suggested
>    by Brendan Higgins.
> v3:
>  * This problem only affects ARCH=um builds then arch/um/Makefile has
>    been changed as suggested by Masahiro Yamada;
>  * And with that the description has also been changed, and also to explain
>    missing points and correct the tags as suggested by Masahiro Yamada:
>    - Fix missing command `make ARCH=um mrproper`;
>    - Add build error message;
>    - Add "Fixes" tag instead of "This bug was ...";
>    - Add "Link" tag instead of "Related bug ...";
>    - Add Reported-by and Suggested-by;
> ---
>  arch/um/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index d2daa206872d..275f5ffdf6f0 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE)
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
>  CLEAN_FILES += linux x.i gmon.out
> +MRPROPER_DIRS += arch/$(SUBARCH)/include/generated
>
>  archclean:
>         @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
