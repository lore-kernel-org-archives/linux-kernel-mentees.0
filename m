From: shreeya.patel23498 at gmail.com (Shreeya Patel)
Date: Sun, 07 Jul 2019 01:26:07 +0530
Subject: [Linux-kernel-mentees] [PATCH] Documentation: cpu-freq: Convert
 core.txt file to ReST format
In-Reply-To: <CAJZ5v0hovK+BY0kozGvkyCgR5CFHpZUu71BZRjUUdCYV8fM5Hg@mail.gmail.com>
References: <20190705210428.8039-1-shreeya.patel23498@gmail.com>
	<CAJZ5v0hovK+BY0kozGvkyCgR5CFHpZUu71BZRjUUdCYV8fM5Hg@mail.gmail.com>
Message-ID: <dcbc0088f31f26f80ab05e51787099df9b70262f.camel@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sat, 2019-07-06 at 09:58 +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 5, 2019 at 11:04 PM Shreeya Patel
> <shreeya.patel23498 at gmail.com> wrote:
> > 
> > Convert core file to ReST format, in order to allow it to
> > be parsed by Sphinx. Make a minor change of correcting the wrong
> > function name cpufreq_put_cpu to cpufreq_cpu_put.
> > Also create an index.rst file in cpu-freq and add it's entry
> > in the main Documentation/index.rst file.
> > 
> > Signed-off-by: Shreeya Patel <shreeya.patel23498 at gmail.com>
> 
> I've said "no" no three previous attempts and this one is not
> different.
> 
Sorry, I was not knowing about it.

> I don't want to have anything .rst in Documentation/cpu-freq/.
> 
> There is a *new* admin-guide doc for cpufreq already and what is
> missing is a *new* driver-api one.
> 
Yes I saw that but it didn't include all the details given in
Documentation/cpu-freq hence I thought of sending this initial patch.

Thanks

> Thanks!
