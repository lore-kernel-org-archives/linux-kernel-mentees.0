Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68505C77B75
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Apr 2023 08:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2EB882073;
	Tue, 18 Apr 2023 08:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2EB882073
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=HqiQuVJJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-g5iPgOhphR; Tue, 18 Apr 2023 08:01:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 54E5780D1B;
	Tue, 18 Apr 2023 08:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54E5780D1B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34C8AC007A;
	Tue, 18 Apr 2023 08:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 866D2C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 08:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7B3415DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 08:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7B3415DE
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HqiQuVJJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BonU6KTqIKEL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 08:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98DB1415BA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98DB1415BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Apr 2023 08:01:33 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C10F61C000F;
 Tue, 18 Apr 2023 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681804890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoVxLgc/JeVD7XmigNqrEEyWoDw10fu8bJGPDHfvFbk=;
 b=HqiQuVJJJWjVVVFRANck/X7gYE+xX7aan6AdB8f4e7WuWRvCrD8k1PmdiCCUgc7nqL2+sS
 10bHaMAYMiCfTKnOmZ9dZqXlstvIZzSScQn5RxoQykTm8qr4U7Wihv1hZ0/yLnDic8b1cJ
 shPuOWkp3RPyb/XR2Re82nbYfVYNq2+CfBJqAtw0drvlxT5QlLuQQl5hFdeJN20sX6Ldq9
 ReDLJQguzh4tnWRE2kJ4jYjXOYGZa05VrWycVlspDxDAO/nJKfW4xQYIz+Q+dorksSQSkr
 kGd/7zq+bPJdSsGf/KTiNagrstQ8klHeZunnT+J3bGj9yFFneZwHmWyTG0uOsg==
Date: Tue, 18 Apr 2023 10:01:27 +0200
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH] selftests: Improves rtctest error handling.
Message-ID: <202304180801276b50d209@mail.local>
References: <20230408074059.397065-1-atulpant.linux@gmail.com>
 <20230408115015bcc4b5ba@mail.local>
 <20230411045115.GA5979@atom0118>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411045115.GA5979@atom0118>
Cc: a.zummo@towertech.it, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Alexandre Belloni via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 11/04/2023 10:21:15+0530, Atul Kumar Pant wrote:
> On Sat, Apr 08, 2023 at 01:50:15PM +0200, Alexandre Belloni wrote:
> > On 08/04/2023 13:10:59+0530, Atul Kumar Pant wrote:
> > > When running the rtctest without root privileges the test fails
> > > expectedly, but prints the logs that are not useful to point to the issue.
> > > Similarly, if we pass wrong rtc device file as an argument, the test
> > > output failure logs do not point to the issue that the rtc file is
> > > invalid.
> > > To handle these issues, this patch adds checks to verify uid with which
> > > the test is run and also if the rtc_file is valid.
> > > 
> > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > ---
> > >  tools/testing/selftests/rtc/rtctest.c | 34 +++++++++++++++++++--------
> > >  1 file changed, 24 insertions(+), 10 deletions(-)
> > > 
> > 
> > Please run your patch through checkpatch.pl, the indentation and comment
> > style are not correct.
> 
> Sure I'll fix this is next patch.
> 
> > 
> > > diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> > > index 2b9d929a24ed..9564346c63eb 100644
> > > --- a/tools/testing/selftests/rtc/rtctest.c
> > > +++ b/tools/testing/selftests/rtc/rtctest.c
> > > @@ -388,16 +388,30 @@ __constructor_order_last(void)
> > >  
> > >  int main(int argc, char **argv)
> > >  {
> > > -	switch (argc) {
> > > -	case 2:
> > > -		rtc_file = argv[1];
> > > -		/* FALLTHROUGH */
> > > -	case 1:
> > > -		break;
> > > -	default:
> > > -		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> > > -		return 1;
> > > +    int ret = -1;
> > > +
> > > +    // Verify if the test is run as root
> > > +    if (getuid() != 0) {
> > > +		ksft_exit_skip("[ERROR]: Please run the test as root - Exiting.\n");
> > 
> > If this is an error, should we really return skip? This may end up being
> > silently ignored whereas the expectation is to test the rtc.
> > 
> 
> Yes, we should not skip the test. In that case we can use 'ksft_exit_fail_msg'.
> I'll fix this in next patch.
> 
> > Also, you may use the rtc as non root so I guess the access() test
> > should be enough.
> 
> I added this check for the use case when we use the rtc file from /dev/ which will require root
> permissions. Should I keep this check ?

You don't need to be root, you need CAP_SYS_TIME and CAP_SYS_RESOURCE, I
wouldn't check for uid 0.

> 
> > 
> > > +    }
> > > +
> > > +    switch (argc) {
> > > +    case 2:
> > > +        rtc_file = argv[1];
> > > +        /* FALLTHROUGH */
> > > +    case 1:
> > > +        break;
> > > +    default:
> > > +        fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
> > > +        return 1;
> > >  	}
> > >  
> > > -	return test_harness_run(argc, argv);
> > > +    // Run the test if rtc_file is valid
> > > +    if (access(rtc_file, F_OK) == 0) {
> > > +	    ret = test_harness_run(argc, argv);
> > > +    } else {
> > > +		ksft_exit_skip("[ERROR]: %s : File does not exists - Exiting\n", rtc_file);
> > 
> > 
> > > +    }
> > > +
> > > +    return ret;
> > >  }
> > > -- 
> > > 2.25.1
> > > 
> > 
> > -- 
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
