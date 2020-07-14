Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEA7C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 21:02:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB8E2064C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 21:02:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUVYKmbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB8E2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8F3E826D8E;
	Tue, 14 Jul 2020 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGr5EhPCTrtC; Tue, 14 Jul 2020 21:02:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B40520784;
	Tue, 14 Jul 2020 21:02:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06F82C0888;
	Tue, 14 Jul 2020 21:02:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64925C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 575338995D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdZ+u+oVfvSa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 21:02:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C4128987B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 21:02:42 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id s21so49224ilk.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2npQXh+dkmWmSHKIQodxnxIAaeJj1A/FFr2Ll6AD3Hs=;
 b=cUVYKmbuMquj1tPPomJ3QAhJreggNlTpwsACBo1UIJy8ABrEJRvYcUBJ+BzMm+B8Pw
 MqSqKdxiUZLp3/SF8aRm3MPFEOcuXTXzReaF83C04QfRQHgm5C83Tljo6P1xGnktBhzD
 OT+ejuCCRxGNB8MkOVi2pHeVYazL4B1RPNhoCnI8kHFaP6uAtl1cDWerw9s1oH2TTw0B
 LM7J/Ue++Hb1A6pAPvTDsxvbkSlC8xNFDSx4dnf7ckP1Hwf+uHJfUVUzdHq5jQZARzeY
 kP3Kn/qUbeuD8v9JUHRLTRkHEjvJZJQ63Z+mmdiHUET6RLX7HxZvg2kwWAFQoo3rA3v3
 6aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2npQXh+dkmWmSHKIQodxnxIAaeJj1A/FFr2Ll6AD3Hs=;
 b=FYjqfsIB+Snrd9fwtSHZdJLQTA3FW0W0E/NLR4QPgFmQXyYCY8VY+xUgH6qZVDLv1N
 I4kOMeIhhssv+L0vaUR/RS4AeYnEVc3sEyykx1trAT34aL27e01OYJ8CDPvDX9ghxaLt
 RW+D4OgqdYg1gxpQbiIQF8TUd6CQ/uWkPrRehiEusPr88JOSGH7Olu+XUc1gDOg1LHcK
 Lm3E3HDEIk3t0AO+MTeFlhEIjHXlAtDogz0Uln/COr0DoCEJ8kMVxEQ3Sf73PL72oEHQ
 EBnmI04WfEVHdLJBNd1SmgrL4HONCRp5nab/V1OYHHRcNM9nAesyYayDwLNu0xBF2P/H
 +BBQ==
X-Gm-Message-State: AOAM532TRFt2QsafCQxp3zVI3/YC+VIuJl0b1sW6ZwN0vthspAkO3XEN
 kUcDW6n1E/W4WYg9cCdW44OBkaGNxfcs0A/q4eY=
X-Google-Smtp-Source: ABdhPJwkddnl6FvRyOMdkmyyDRG9lWADdbl/Rct2E+/PQzsVJk9f8CH9Av6NUhTRswYDc3FssSb6pCSldchYVLW9F38=
X-Received: by 2002:a92:9a4f:: with SMTP id t76mr6568425ili.174.1594760561627; 
 Tue, 14 Jul 2020 14:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:21d8:0:0:0:0 with HTTP; Tue, 14 Jul 2020 14:02:40
 -0700 (PDT)
In-Reply-To: <20200714184550.GA397277@bjorn-Precision-5520>
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
From: Kjetil Oftedal <oftedal@gmail.com>
Date: Tue, 14 Jul 2020 23:02:40 +0200
Message-ID: <CALMQjD9OVTbLVPGX-9+GDekZ02Wsqdz57-k1uCBMXC7cT3K_7w@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci <linux-pci@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 00/35] Move all PCIBIOS*
	definitions into arch/x86
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

On 14/07/2020, Bjorn Helgaas <helgaas@kernel.org> wrote:

>>
>> a) callers of the high-level config space accessors
>>    pci_{write,read}_config_{byte,word,dword}, mostly in device
>>    drivers.
>> b) low-level implementation of the config space accessors
>>     through struct pci_ops
>> c) all other occurrences of these constants
>>
>> Starting with a), my first question is whether any high-level
>> drivers even need to care about errors from these functions. I see
>> 4913 callers that ignore the return code, and 576 that actually
>> check it, and almost none care about the specific error (as you
>> found as well). Unless we conclude that most PCI drivers are wrong,
>> could we just change the return type to 'void' and assume they never
>> fail for valid arguments on a valid pci_device* ?
>
> I really like this idea.
>
> pci_write_config_*() has one return value, and only 100ish of 2500
> callers check for errors.  It's sometimes possible for config
> accessors to detect PCI errors and return failure, e.g., device was
> removed or didn't respond, but most of them don't, and detecting these
> errors is not really that valuable.
>
> pci_read_config_*() is much more interesting because it returns two
> things, the function return value and the value read from the PCI
> device, and it's complicated to check both.
>
> Again it's sometimes possible for config read accessors to detect PCI
> errors, but in most cases a PCI error means the accessor returns
> success and the value from PCI is ~0.
>
> Checking the function return value catches programming errors (bad
> alignment, etc) but misses most of the interesting errors (device was
> unplugged or reported a PCI error).
>
> Checking the value returned from PCI is tricky because ~0 is a valid
> value for some config registers, and only the driver knows for sure.
> If the driver knows that ~0 is a possible value, it would have to do
> something else, e.g., another config read of a register that *cannot*
> be ~0, to see whether it's really an error.
>
> I suspect that if we had a single value to look at it would be easier
> to get right.  Error checking with current interface would look like
> this:
>
>   err = pci_read_config_word(dev, addr, &val);
>   if (err)
>     return -EINVAL;
>
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     err = pci_read_config_word(dev, PCI_VENDOR_ID, &val2);
>     if (err)
>       return -EINVAL;
>
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Error checking with a possible interface that returned only a single
> value could look like this:
>
>   val = pci_config_read_word(dev, addr);
>   if (PCI_POSSIBLE_ERROR(val)) {
>     /* if driver knows ~0 is invalid */
>     return -EINVAL;
>
>     /* if ~0 is potentially a valid value */
>     val2 = pci_config_read_word(dev, PCI_VENDOR_ID);
>     if (PCI_POSSIBLE_ERROR(val2))
>       return -EINVAL;
>   }
>
> Am I understanding you correctly?

Let us not do this. Reading config space is really expensive on some
architectures. Requiring a driver to do it twice on some values does not
improve upon that situation. And is quite redundant if the Root Complex
driver already knows that the first access has failed.

Additionally since multiple config accesses to the same devices is not
allowed in the spec, the hardware must block and wait for a timeout if
a config access does not get a response.
(Can happen if a intermediate link between the RC and endpoint has to retrain)
Having to block twice is very much not ideal. And in the case with
retraining the secondary access might even succeed. As the link might
recover between reading the first config word and reading PCI_VENDOR_ID.
Thus allowing the driver to accept invalid data from the device.

>
>> For b), it might be nice to also change other aspects of the
>> interface, e.g. passing a pci_host_bridge pointer plus bus number
>> instead of a pci_bus pointer, or having the callback in the
>> pci_host_bridge structure.
>
> I like this idea a lot, too.  I think the fact that
> pci_bus_read_config_word() requires a pci_bus * complicates things in
> a few places.
>
> I think it's completely separate, as you say, and we should defer it
> for now because even part a) is a lot of work.  I added it to my list
> of possible future projects.
>

What about strange PCI devices such as Non-Transparent bridges?
They will require their own PCI Config space accessors that is not
connected to a host bridge if one wants to do some sort of
punch-through enumeration.
I guess the kernel doesn't care much about them?

Best regards,
Kjetil Oftedal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
