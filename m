Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11153C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 08:59:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C082076B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 08:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="z95BENQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C082076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9497487D7C;
	Wed, 12 Aug 2020 08:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOA7eLPi1ViM; Wed, 12 Aug 2020 08:59:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9AFF87D14;
	Wed, 12 Aug 2020 08:59:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4E13C013C;
	Wed, 12 Aug 2020 08:59:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63A3EC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 535858612E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xqk9rDfNkwH1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:59:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5789386113
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 08:59:16 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07C8pwEP159483;
 Wed, 12 Aug 2020 08:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=fX5Hq12QB3O54zKi56LfEX/5PhMYcRNizebtS1uhJZQ=;
 b=z95BENQnuCk+9ZFmipY4ugqKKVuN5wdZa3NCOnxx8GsoNTFsTNUGlUUwRGwlJl6oq0h0
 6DZY0KCiVtzVp/Q/gGx07HLD5UDiVXf6ffX80cbrR9My/cF85N9pfEpF4cbut05WaQy8
 5ISY+hiv86gIwjC0VbQaLZ2GKwrbQsvMxGCH2ETye018Y7Ln6V+GTtYi1XqwiZ3dFx25
 +uQzAO8NTZZxtcWvKzwvPN98rxrnnRyYhyADWJHtS8MfKQAWHZjDPE8AERycH92HoDZH
 z0RKErQKqsotkdHJk8ta3suUVlezia62jBO0WSSNFNnWp/RaH/qd/JYpIdgEtSH6gk2G iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32t2ydqunn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Aug 2020 08:59:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07C8rLm8092500;
 Wed, 12 Aug 2020 08:59:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 32t5y6cah2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 08:59:11 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07C8xAgB015682;
 Wed, 12 Aug 2020 08:59:11 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 12 Aug 2020 08:59:10 +0000
Date: Wed, 12 Aug 2020 11:59:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200812085904.GA16441@kadam>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812071306.GA869606@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9710
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9710
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008120064
Cc: linux-fsdevel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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

Yeah, the patch doesn't work at all.  I looked at one call tree and it
is:

hfs_mdb_get() tries to allocate HFS_SB(sb)->ext_tree.

	HFS_SB(sb)->ext_tree = hfs_btree_open(sb, HFS_EXT_CNID, hfs_ext_keycmp);
                    ^^^^^^^^

hfs_btree_open() calls page = read_mapping_page(mapping, 0, NULL);
read_mapping_page() calls mapping->a_ops->readpage() which leads to
hfs_readpage() which leads to hfs_ext_read_extent() which calls
res = hfs_find_init(HFS_SB(inode->i_sb)->ext_tree, &fd);
                                         ^^^^^^^^

So we need ->ext_tree to be non-NULL before we can set ->ext_tree to be
non-NULL...  :/

I wonder how long this has been broken and if we should just delete the
AFS file system.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
