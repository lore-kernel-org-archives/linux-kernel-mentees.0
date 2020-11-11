Return-Path: <SRS0=RhO4=ER=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC77C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 15:50:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E1520709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Nov 2020 15:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E1520709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 76E45226EA;
	Wed, 11 Nov 2020 15:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsBELyiEnJhe; Wed, 11 Nov 2020 15:50:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8D55D204EC;
	Wed, 11 Nov 2020 15:50:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7217AC088B;
	Wed, 11 Nov 2020 15:50:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B7A6C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 15:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 089ED854E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 15:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRpXQqZUVMgp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 15:50:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0210.hostedemail.com
 [216.40.44.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0DD70854DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Nov 2020 15:50:48 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 97580100E7B49;
 Wed, 11 Nov 2020 15:50:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: back47_1a07090272fe
X-Filterd-Recvd-Size: 2673
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Nov 2020 15:50:45 +0000 (UTC)
Message-ID: <f21acc492ab37acc42390abffb61aed370a22118.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 11 Nov 2020 07:50:44 -0800
In-Reply-To: <2b640e8b-69dc-2ade-3b9f-fae14eed1b17@gmail.com>
References: <20201111090143.9230-1-yashsri421@gmail.com>
 <CAKXUXMzg6Wg310s-N8hWOEiXFkg1ZAga+NkFQkFQ5_bS16TLnA@mail.gmail.com>
 <2b640e8b-69dc-2ade-3b9f-fae14eed1b17@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for MISSING_SIGN_OFF
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

On Wed, 2020-11-11 at 16:39 +0530, Aditya wrote:
> On 11/11/20 4:00 pm, Lukas Bulwahn wrote:
> > On Wed, Nov 11, 2020 at 10:01 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
> > > 
> > > Currently checkpatch warns us if there is no 'Signed-off-by' line
> > > for the patch.
> > > 
> > > E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> > > Completely remove --version flag") reports this error:
> > > 
> > > ERROR: Missing Signed-off-by: line(s)
> > > 
> > > Provide a fix by adding a Signed-off-by line corresponding to the author
> > > of the patch before the patch separator line. Also avoid this error for
> > > the commits where some typo is present in the sign off.
[]
> > I think it should still warn about a Missing Signed-off-by: even when
> > we know there is a $non_standard_signature. So, checkpatch simply
> > emits two warnings; that is okay in that case.
> > 
> > It is just that our evaluation shows that the provided fix option
> > should not be suggested when there is a $non_standard_signature
> > because we actually would predict that there is typo in the intended
> > Signed-off-by tag and the fix that checkpatch would suggest would not
> > be adequate.
> > 
> > Joe, what is your opinion?
> > 
> > Aditya, it should not be too difficult to implement the rule that way, right?
> > 
> 
> No, I'd probably just have to add the check with $fix, instead of with
> $signoff

I think it does not matter much which is chosen.

The bad signed-off-by: line would still need to be corrected one
way or another and the added signed-off-line is also possibly
incorrect so it could need to be modified or deleted.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
