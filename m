Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C8FC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 07:16:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF77120B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 07:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j3+hqm0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF77120B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74954873D6;
	Tue, 21 Jul 2020 07:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDWA9tqvDtee; Tue, 21 Jul 2020 07:16:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E915C873CE;
	Tue, 21 Jul 2020 07:16:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCEE4C088E;
	Tue, 21 Jul 2020 07:16:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04176C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D4EA225CF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoD6ICjyCF6J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:16:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by silver.osuosl.org (Postfix) with ESMTPS id BC22F25CA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 07:16:51 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L7CQZv153369;
 Tue, 21 Jul 2020 07:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AT8MPX1I7JDGF5HyAbGwZsBOaJxJlWlbPtr2s+bQvXI=;
 b=j3+hqm0Hct2HUZjcrInvEK3Go5+dEl952yCfPrFY+14OMhtvvyYJps9H5hRVfvWdr6RM
 95mhMIC8q3WO3a6vyw76+NLfDBvRbr/npenLimFLByMOTtd7AZzf3rYpMMSLtzBPe1Ec
 VAdnuXc0SuGoi5JFdcDZnfmGNGulxLNyYi+Fl2/pJMloycxyEEHDkHIGhlSWZ22E9taL
 nlxtocn7MJLe62gjw+Fp3mEPRXgVVaHR87aIADY/ykGH4dWqxxx9dIIefCeGOvlbTFJD
 kg6ggW2RbcsFVCTGUbTYuUrt384dtlE2ZgYCwnjzxCJUHxMGstyBGHVEV7yYwJw5Zs9d iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32brgrb85p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Jul 2020 07:16:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L7D09F152262;
 Tue, 21 Jul 2020 07:16:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 32dufdh135-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 07:16:46 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06L7Gijb015107;
 Tue, 21 Jul 2020 07:16:45 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Jul 2020 07:16:44 +0000
Date: Tue, 21 Jul 2020 10:16:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200721071637.GK2571@kadam>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam> <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720191656.GA3366@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210049
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210049
Cc: linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix
 slab-out-of-bounds write in hiddev_ioctl_usage()
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

For some reason the reply-to header on your email is bogus:

Reply-To: 20200720121257.GJ2571@kadam

"kadam" is a system on my home network.

On Mon, Jul 20, 2020 at 03:16:56PM -0400, Peilin Ye wrote:
> I made some mistakes in the previous e-mail. Please ignore that. There
> are a lot of things going on...Sorry for that.
> 
> On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> > So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> > the earlier check.  That risks breaking userspace.  Another option is to
> > just add a check like you did earlier to the HIDIOCGUSAGE case.
> > Probably just do option #2 and resend.
> 
> Sure, I will just add the same check to the HIDIOCGUSAGE case for the
> time being. Thank you for the detailed explanation.
> 
> Here's what I found after digging a bit further though:
> 
> hid_open_report() calls different functions in order to process
> different type of items:
> 
> drivers/hid/hid-core.c:1193:
> 
>         static int (*dispatch_type[])(struct hid_parser *parser,
>                                       struct hid_item *item) = {
>                 hid_parser_main,
>                 hid_parser_global,
>                 hid_parser_local,
>                 hid_parser_reserved
>         };
> 
> In this case, hid_parser_main() calls hid_add_field(), which in turn
> calls hid_register_field(), which allocates the `field` object as you
> mentioned:
> 
> drivers/hid/hid-core.c:102:
> 
>         field = kzalloc((sizeof(struct hid_field) +
>                          usages * sizeof(struct hid_usage) +
>                          values * sizeof(unsigned)), GFP_KERNEL);

Yeah.  And in the caller it does:

drivers/hid/hid-core.c
   297          if (!parser->local.usage_index) /* Ignore padding fields */
   298                  return 0;
   299  
   300          usages = max_t(unsigned, parser->local.usage_index,
                ^^^^^^^^^^^^^^
   301                                   parser->global.report_count);
   302  
   303          field = hid_register_field(report, usages, parser->global.report_count);
                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So ->usages is always greater or equal to ->global.report_count.

   304          if (!field)
   305                  return 0;
   306  
   307          field->physical = hid_lookup_collection(parser, HID_COLLECTION_PHYSICAL);

> 
> Here, `values` equals to `global.report_count`. See how it is being
> called:
> 
> drivers/hid/hid-core.c:303:
> 
>         field = hid_register_field(report, usages, parser->global.report_count);
> 
> In hid_open_report(), `global.report_count` can be set by calling
> hid_parser_global().
> 
> However, the syzkaller reproducer made hid_open_report() to call
> hid_parser_main() __before__ `global.report_count` is properly set. It's
> zero. So hid_register_field() allocated `field` with `values` equals to
> zero - No room for value[] at all. I believe this caused the bug.

I don't know if zero is valid or not.  I suspect it is valid.  We have
no reason to think that it's invalid.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
