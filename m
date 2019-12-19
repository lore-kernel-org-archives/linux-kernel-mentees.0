Return-Path: <SRS0=GqCC=2J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8F8C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:09:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D73824676
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 17:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5bardie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D73824676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E1AF87FD1;
	Thu, 19 Dec 2019 17:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxg6Vc9qrlhB; Thu, 19 Dec 2019 17:09:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E60A87FCE;
	Thu, 19 Dec 2019 17:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82EF9C18DC;
	Thu, 19 Dec 2019 17:09:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54115C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3FDD287FD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OayXVEzHUekP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 833D787FCE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 17:09:32 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a33so3447379pgm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 09:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=FhMzwWPgc7fU8atIpzaZVFtw/U/9Kv1H8wmkxK1VjLs=;
 b=M5bardieozPvTuwlCJIikQlCKFjLMSEddtQ+HRGpIo9NLI0ljM/o/wzmMqO+N3eMU1
 UVR43y9T/9vePdOXgi/KbIAGkLwbgst1WFaA0cAcLqCdhyZyp8RuJENJaP3RgPxhsfrN
 3qwpErVGnVvCJUiYqKWSn37fMP8zP0s7iIxP7Jhryge7cPrZy0PszYrUh1cT775ZWhgs
 9HDWwKQ0iMl8JT3lVAAMhBJOF595O1dQRHbNLZDnmLrudK8Vxqox87/HR5P5zmj/zi+y
 uef7ztjWGj4Ds5je0tAwjT6BfWKnRdsPBKmzzYVuI7+j4jAHFUl5DZtBrz93Ibo57KIL
 3tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=FhMzwWPgc7fU8atIpzaZVFtw/U/9Kv1H8wmkxK1VjLs=;
 b=Dbqv0KpCEVI48EGmaHdYHB+AOMpsZze5MeCckzsL1U5Oxy6lUBiyFM4QR/5mRvRpPG
 owE98ld039MuZVKF0M7jZaz1Iwp1vIPMbJkEJVaCYTXH1oEQ1CbPf4xHoPKWvcMe9bLl
 wbQkio3cj2lIYA8mI8H1V1se+rV7WmLbCJAkD3R1r8/QiW4OlL43U3VMTGVQxxWyoU8J
 qKXM/233PiuIO9EBbciVHYSYSKK++/4dgn6NSwSBRHlkHIIIxMOELL9bfX4hhdPBfw9O
 jEyEmP49vzsXIBOlQoXxcZDoJp2Et1VD4FVllaA1KcNv5wlN6CBt3cKasBKIx9WnaYpC
 e42Q==
X-Gm-Message-State: APjAAAWzwvcP98kBL7NRGzZXo+8zFzdhduxfJDdCqcqYz1uDZErMCZln
 M7buPofFqplNqxDpZxtfSzZpQsZIel0=
X-Google-Smtp-Source: APXvYqwek5uOKkG2a821/+4sr21dKbGGao486J5oLsjm3fXJA9ICuJK2+GcYXlxum9A/6L0u27yKqA==
X-Received: by 2002:a62:7883:: with SMTP id
 t125mr11125639pfc.141.1576775371930; 
 Thu, 19 Dec 2019 09:09:31 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id n1sm7751763pfd.47.2019.12.19.09.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:09:31 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <20191121130605.29074-1-dwlsalmeida@gmail.com>
 <20191219100025.255003e6@lwn.net>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <03f1a517-bd25-bde8-7b5e-35a51e354417@gmail.com>
Date: Thu, 19 Dec 2019 14:09:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191219100025.255003e6@lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, hirofumi@mail.parknet.co.jp,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	convert vfat.txt to RST
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
Content-Type: multipart/mixed; boundary="===============6274462655396262322=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============6274462655396262322==
Content-Type: multipart/alternative;
 boundary="------------AC73348042DA41F06431820D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AC73348042DA41F06431820D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Jonathan,


This is also pending.


> I did not move this into admin-guide, waiting on what the
> maintainer has to say about this and also about old sections
> in the text, if any.

....

> I have one other thing here, that could use input from the vfat maintainer:
>
> [...]
>
>> +BUG REPORTS
>> +===========
>> +If you have trouble with the*VFAT*  filesystem, mail bug reports to
>> +chaffee@bmrc.cs.berkeley.edu.
>> +
>> +Please specify the filename and the operation that gave you trouble.
>> +
>> +TEST SUITE
>> +==========
>> +If you plan to make any modifications to the vfat filesystem, please
>> +get the test suite that comes with the vfat distribution at
>> +
>> +`<http://web.archive.org/web/*/http://bmrc.berkeley.edu/people/chaffee/vfat.html>`_
>> +
>> +This tests quite a few parts of the vfat filesystem and additional
>> +tests for new features or untested features would be appreciated.
> What are the chances that the above email address works at all, especially
> given that the associated web page has to be dug out of the wayback
> machine?  We should really try to avoid perpetuating obviously wrong
> information when we can.  Hirofumi, do you have any thoughts on what might
> replace this section?
>
> Thanks,
>
> jon


Thanks!



--------------AC73348042DA41F06431820D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey Jonathan,</p>
    <p><br>
    </p>
    <p>This is also pending.</p>
    <p><br>
    </p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I did not move this into admin-guide, waiting on what the 
maintainer has to say about this and also about old sections
in the text, if any.
</pre>
      </blockquote>
    </p>
    <p>....</p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I have one other thing here, that could use input from the vfat maintainer:

[...]

</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">+BUG REPORTS
+===========
+If you have trouble with the <b class="moz-txt-star"><span class="moz-txt-tag">*</span>VFAT<span class="moz-txt-tag">*</span></b> filesystem, mail bug reports to
+chaffee@bmrc.cs.berkeley.edu.
+
+Please specify the filename and the operation that gave you trouble.
+
+TEST SUITE
+==========
+If you plan to make any modifications to the vfat filesystem, please
+get the test suite that comes with the vfat distribution at
+
+`<a class="moz-txt-link-rfc2396E" href="http://web.archive.org/web/*/http://bmrc.berkeley.edu/people/chaffee/vfat.html">&lt;http://web.archive.org/web/*/http://bmrc.berkeley.edu/people/chaffee/vfat.html&gt;</a>`_
+
+This tests quite a few parts of the vfat filesystem and additional
+tests for new features or untested features would be appreciated.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">What are the chances that the above email address works at all, especially
given that the associated web page has to be dug out of the wayback
machine?  We should really try to avoid perpetuating obviously wrong
information when we can.  Hirofumi, do you have any thoughts on what might
replace this section?

Thanks,

jon
</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
    <p>Thanks!<br>
    </p>
    <br>
  </body>
</html>

--------------AC73348042DA41F06431820D--

--===============6274462655396262322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6274462655396262322==--
