Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD9AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:49:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB162083E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:49:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RHGOqG8d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDB162083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F3A5883FF;
	Tue, 28 Jul 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vUpe4KAYIxZ; Tue, 28 Jul 2020 09:49:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F6D28817F;
	Tue, 28 Jul 2020 09:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B698C004F;
	Tue, 28 Jul 2020 09:49:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47D63C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 376B987F8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3gaeoPoXpluF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DB6A87F85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:49:25 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06S9lbhf066911;
 Tue, 28 Jul 2020 09:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=rpWZKXpfcgCMYXeQKxkp0jEtjZDm2wSN5bawvDhbAhI=;
 b=RHGOqG8dTPJ5NALSMpvdeddNQ54+xaa5Q/erBU88ZT/GJLZBlcXYebUjup49HWEgkjDy
 mwduiRUtCVkrZoznRC5zZmEg0EsXRoQCPZBotgPUB/zj39fjEjVbJbPM6POTWaIZOSKz
 yq6nK7I5W8q/pYVR8153JE6GwwybwMU4f1nmeB4wauKUPepRAxtdZCIZcge2Ti/lAzu7
 3ALbflGCdp/I2O/avjzYSy2iofVckYqg9YHqA+otMOEpx5ZX9i6wFsyTTa85THQpS2Gt
 +hRt0dZq7q+gq7OlB3w6EdjaWwwuCSbAam4BN8WzdpMtevVvsLI8vy5/Nfy15D2pW+wa ZQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 32hu1jegnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jul 2020 09:49:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06S9dJYF153100;
 Tue, 28 Jul 2020 09:47:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 32hu5scqdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 09:47:20 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06S9lDQ2030023;
 Tue, 28 Jul 2020 09:47:13 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jul 2020 02:47:13 -0700
Date: Tue, 28 Jul 2020 12:47:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200728094707.GF2571@kadam>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <20200727223357.GA329006@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727223357.GA329006@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9695
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280073
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Mon, Jul 27, 2020 at 06:33:57PM -0400, Peilin Ye wrote:
> On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > drivers/block/floppy.c:3132 raw_cmd_copyout() warn: check that 'cmd' doesn't leak information (struct has a hole after 'flags')
> 
> (Removed some Cc: recipients from the list.)
> 
> I'm not very sure, but I think this one is also a false positive.

No, it's a potential bug.  You're over thinking what Smatch is
complaining about.  Arnd is right.

  3123  static int raw_cmd_copyout(int cmd, void __user *param,
  3124                                    struct floppy_raw_cmd *ptr)
  3125  {
  3126          int ret;
  3127  
  3128          while (ptr) {
  3129                  struct floppy_raw_cmd cmd = *ptr;
                                              ^^^^^^^^^^
The compiler can either do this assignment as an memcpy() or as a
series of struct member assignments.  So the assignment can leave the
struct hole uninitialized.

  3130                  cmd.next = NULL;
  3131                  cmd.kernel_data = NULL;
  3132                  ret = copy_to_user(param, &cmd, sizeof(cmd));
                                                  ^^^^
potential info leak.

  3133                  if (ret)
  3134                          return -EFAULT;
  3135                  param += sizeof(struct floppy_raw_cmd);
  3136                  if ((ptr->flags & FD_RAW_READ) && ptr->buffer_length) {
  3137                          if (ptr->length >= 0 &&
  3138                              ptr->length <= ptr->buffer_length) {
  3139                                  long length = ptr->buffer_length - ptr->length;
  3140                                  ret = fd_copyout(ptr->data, ptr->kernel_data,
  3141                                                   length);
  3142                                  if (ret)
  3143                                          return ret;
  3144                          }
  3145                  }
  3146                  ptr = ptr->next;
  3147          }
  3148  
  3149          return 0;
  3150  }

regards,
dan carpenter
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
