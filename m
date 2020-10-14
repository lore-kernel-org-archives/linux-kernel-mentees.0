Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7890C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:35:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F8820878
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 07:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F8820878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 461FF2E23A;
	Wed, 14 Oct 2020 07:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgTUJ8i5puBD; Wed, 14 Oct 2020 07:35:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 48FCD2E176;
	Wed, 14 Oct 2020 07:35:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36C77C07FF;
	Wed, 14 Oct 2020 07:35:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F70CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D41C8777F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXozl9aHpq_8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:35:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0043.hostedemail.com
 [216.40.44.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3D1BB87746
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:35:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 4F44918012894
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 07:35:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 1100118224092;
 Wed, 14 Oct 2020 07:35:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: week96_5108ae82720a
X-Filterd-Recvd-Size: 5175
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 14 Oct 2020 07:35:34 +0000 (UTC)
Message-ID: <4d55bf3eb55ea91639438eb949268b9a42140759.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 14 Oct 2020 00:35:32 -0700
In-Reply-To: <alpine.DEB.2.21.2010140908240.6186@felia>
References: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010140734270.6186@felia>
 <316d5a53351d10cd1a26ce0c54883da05642c898.camel@perches.com>
 <alpine.DEB.2.21.2010140812370.6186@felia>
 <be7deeec0937327e0ddaadf8468d934ed363a533.camel@perches.com>
 <alpine.DEB.2.21.2010140829150.6186@felia>
 <04325089b524f20d3de167051bfb81b05083d8b1.camel@perches.com>
 <alpine.DEB.2.21.2010140842310.6186@felia>
 <084a2dabe5463a3528bb052515555f939235c012.camel@perches.com>
 <alpine.DEB.2.21.2010140908240.6186@felia>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang
 check to EXECUTE_PERMISSIONS
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

On Wed, 2020-10-14 at 09:17 +0200, Lukas Bulwahn wrote:
> $ clang-format-10 --version
> Ubuntu clang-format version 
> 10.0.1-++20200928083909+ef32c611aa2-1~exp1~20200928185400.194
> 
> $ clang-format-10 --help | grep 'dry-run'
>   --dry-run                  - If set, do not actually make the formatting 
> changes
>   --ferror-limit=<uint>      - Set the maximum number of clang-format
>     errors to emit before stopping (0 = no limit). Used only with --dry-run or -n
>   -n                         - Alias for --dry-run

OK, maybe so.

However I think the clang-format --dry-run output doesn't
currently contain particularly useful information.  Maybe
later versions are better than version 10.

For instance:

$ /usr/bin/clang-format-10 --version
clang-format version 10.0.0-4ubuntu1 

$ /usr/bin/clang-format-10 --dry-run drivers/net/ethernet/intel/igb/igb_main.c 2>&1 | head -25
drivers/net/ethernet/intel/igb/igb_main.c:54:40: warning: code should be clang-formatted [-Wclang-format-violations]
static const char igb_driver_string[] =
                                       ^
drivers/net/ethernet/intel/igb/igb_main.c:56:36: warning: code should be clang-formatted [-Wclang-format-violations]
static const char igb_copyright[] =
                                   ^
drivers/net/ethernet/intel/igb/igb_main.c:100:3: warning: code should be clang-formatted [-Wclang-format-violations]
        {0, }
         ^
drivers/net/ethernet/intel/igb/igb_main.c:100:5: warning: code should be clang-formatted [-Wclang-format-violations]
        {0, }
           ^
drivers/net/ethernet/intel/igb/igb_main.c:163:58: warning: code should be clang-formatted [-Wclang-format-violations]
static int igb_ndo_set_vf_vlan(struct net_device *netdev,
                                                         ^
drivers/net/ethernet/intel/igb/igb_main.c:164:28: warning: code should be clang-formatted [-Wclang-format-violations]
                               int vf, u16 vlan, u8 qos, __be16 vlan_proto);
                                                ^
drivers/net/ethernet/intel/igb/igb_main.c:189:50: warning: code should be clang-formatted [-Wclang-format-violations]
        SET_SYSTEM_SLEEP_PM_OPS(igb_suspend, igb_resume)
                                                        ^
drivers/net/ethernet/intel/igb/igb_main.c:190:21: warning: code should be clang-formatted [-Wclang-format-violations]
        SET_RUNTIME_PM_OPS(igb_runtime_suspend, igb_runtime_resume,
                           ^
drivers/net/ethernet/intel/igb/igb_main.c:190:61: warning: code should be clang-formatted [-Wclang-format-violations]

vs

$ ./scripts/checkpatch.pl -f drivers/net/ethernet/intel/igb/igb_main.c 2>&1 | head -25
WARNING: externs should be avoided in .c files
#113: FILE: drivers/net/ethernet/intel/igb/igb_main.c:113:
+int igb_open(struct net_device *);

WARNING: function definition argument 'struct net_device *' should also have an identifier name
#113: FILE: drivers/net/ethernet/intel/igb/igb_main.c:113:
+int igb_open(struct net_device *);

WARNING: externs should be avoided in .c files
#114: FILE: drivers/net/ethernet/intel/igb/igb_main.c:114:
+int igb_close(struct net_device *);

WARNING: function definition argument 'struct net_device *' should also have an identifier name
#114: FILE: drivers/net/ethernet/intel/igb/igb_main.c:114:
+int igb_close(struct net_device *);

CHECK: Alignment should match open parenthesis
#191: FILE: drivers/net/ethernet/intel/igb/igb_main.c:191:
+	SET_RUNTIME_PM_OPS(igb_runtime_suspend, igb_runtime_resume,
+			igb_runtime_idle)

CHECK: Please use a blank line after function/struct/union/enum declarations
#193: FILE: drivers/net/ethernet/intel/igb/igb_main.c:193:
+};
+static void igb_shutdown(struct pci_dev *);


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
