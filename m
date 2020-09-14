Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA373C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 08:33:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A159C22204
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 08:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="s0tLnr4f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A159C22204
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D7D38669C;
	Mon, 14 Sep 2020 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e+8Xpxcxft6X; Mon, 14 Sep 2020 08:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1779686673;
	Mon, 14 Sep 2020 08:33:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0820C0864;
	Mon, 14 Sep 2020 08:33:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ABE2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3078E870AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzLt5hAxJpI4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lb3-smtp-cloud9.xs4all.net (lb3-smtp-cloud9.xs4all.net
 [194.109.24.30])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DE420870AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 08:33:38 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id HjvakANHZXgwIHjvbkiHlg; Mon, 14 Sep 2020 10:33:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1600072416; bh=6cBkkDse8EnkRRQ/hU3Yx+Zl6dVYvWZOTnnSJT950bY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=s0tLnr4fNdm34rCsFKkod1eZ0480CjguoMSroHrjyp8pK34KS1X3DdtgPhH1blAmS
 kykcz88t+rIwjuwdg40KnZDmmjKaxh4HnjMnsulxBB6vBnrLmFZExSqBtxzt/SQHZw
 csoBRI3Y7ufjUsxuLHuZC6dlIvF1RPVmHiWS26a6GurLqIe/M3zruWvR0n3867VGsN
 AF14zo6ow8h5IoKl8FNxMGV8Ygl33XtCsCjMvZgfU9DfcWtM378MUmmPPk9JnCQjfu
 Z+TtROGUzkZ+yHFM5km96w7FVf5BvBiex5LEsH+FYuUGqWJWYhNnhxnPe8IkyoZSwR
 kJFDKuf6PDuHQ==
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <20200912111506.2d2bd512@coco.lan>
 <15028D87-A496-4CAD-91A6-E4467489C4D0@getmailspring.com>
 <20200912195702.58f71f8f@coco.lan>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2cbf772e-59e7-36ca-8d39-320fc62d47d8@xs4all.nl>
Date: Mon, 14 Sep 2020 10:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200912195702.58f71f8f@coco.lan>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPKHkAZdeQCjfnPgss7wjvVcjUHwSU5iEEbYywCPuNhxACJ4n7sXNoZAlo6glpN0NU1gS4c+/tMu3PBThBoM1rz9A04oIarcIfwPyDJZn1H0guZ/yOiR
 myT/m7FcmVxRJimNEsbEZPL/4iW9LxCE/a2Q8fzulMCEGzd3qAqgtr94ob+kNGkNX8Nq6S7nsq1iZBGeQnAp5loT5a0S07qDfjbIwMCEolWA9In8pmhzeJsZ
 OWZRVSWly/UDqtCuPFNpatLFzyOPgefB0bPcRLo7zZMaZxMwFWFp9uJd+2pEYSUErzM3jnlEGf41yTXAStrFh/D32YLchBP4f+dlAxxE+O8S+3PxaT37CbgB
 hApSq/jFlZjJ2VQ2piaCg+DCy124SQfL94dHhiYkDJd8l5qtYPqQlacqsdpGEZhTc3JgeuRz9BcptX2RuwR4h66cvGo5efxiKMfcUe1txOVvkBj0EMVns+fm
 SdwsaXX3sC24ZiGd5izF2kNznC4iP/aM+qX/Y20JWD/NRWp2ZSNThkazxbkOwQvVkbgSNnmF89p4LwCwZldjtUUYQtl9nR2OnigzYg==
Cc: "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
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

On 12/09/2020 19:57, Mauro Carvalho Chehab wrote:
> Em Sat, 12 Sep 2020 11:49:01 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 
>> Hi Hans and Mauro & all
>>
>>
>>> Why the dvb_ prefix? All virtual drivers just start with 'vi'.
>>>
>>> And wouldn't it make more sense to call dvb_vidtv_bridge.ko just vidtv.ko?
>>> Just like the other virtual media drivers?  
>>
>> I guess Mauro was the one to come up with the dvb_* prefix for the
>> kernel modules for the reasons he explicited up in this thread. 
>>
>> As far as dvb_vidtv_bridge.ko and vidtv_bridge.c, I just wanted to be
>> verbose so that people would look at this and see that it is the code
>> for a bridge driver, since this is also supposed to be a template. 
>>
>> Also because I had some trouble myself figuring out what was what when
>> first browsing through other dvb drivers. That said, I am 100% onboard
>> with renaming this to vidtv.ko or whatever seems more appropiate :)
> 
> Let us think a little bit about that. 
> 
>>
>>
>>> Yet, I agree with you that at least an alias is needed.
>>> earlier today, I wrote a patch with such purpose:  
>>
>> If you all would like to just leave this at that ^ I am also ok with it.
>>
>>> For regression testing of vidtv during the daily build it would be  
>> great if
>>> the contrib/test/test-media script can be enhanced to include vidtv.  
>>
>> Sure, I can do that if you'd like. Can you provide some tips on how to
>> get started? :)
> 
> Hans can explain it better, but the hole idea is to have a set of
> userspace apps that will ensure that drivers will properly implement
> the DVB API.
> 
> I suspect that, before that (or together with such tooling), we need
> to properly implement the frontend ioctl, validating the per delivery
> system parameters, as, right now, it just accepts anything from
> userspace. 

Daniel, if you look at the test-media script, then you'll see that it has
separate sections for each virtual driver. It's probably best to look at
the vim2m driver tests since that's the easiest.

It loads the module, then it starts v4l2-compliance to test the API. This
utility basically tries all V4L2 APIs and checks that the driver conforms to
the spec.

Note that you see options like '-m platform:vim2m' that selects which /dev/media
device to use based on the name and v4l2-compliance (or v4l2-ctl with the -z option)
then walks the topology of the media device and tests all interfaces it finds.

Hence my question about media controller support in vidtv: this should be
supported there as well since it allows you to write these test sequences without
having to know which /dev/fooX device should be used.

After the compliance test is run the script tests unbind/bind (always a nasty test)
and checks for memory leaks (if enabled in the kernel).

Much of this test sequence can be copied for vidtv, but you need something else for
the compliance test. It would for now be enough to have some quick check with the
existing dvb utils from v4l-utils to see that the basics work.

IMHO I think a dtv-compliance utility along the lines of v4l2-compliance and
cec-compliance should be created.

I'm actually wondering whether the dtv compliance tests shouldn't be part of
v4l2-compliance (which would have to be renamed to media-compliance in that case)
since there are hybrid drivers supporting both in the same media topology.

This would make compliance tests possible where analog/digital TV mode handling
is tested (i.e. if analog TV is in use, then trying to use digital TV would return
EBUSY and vice versa).

It would require some work in v4l2-compliance.cpp to make this possible, but I
can do that myself.

Compliance tests have proven to be a great method of testing for regressions and
testing drivers in general.

Note that it takes a lot of time to create good compliance tests, but you just start
with some simple tests and expand it over time.

Regards,

	Hans
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
